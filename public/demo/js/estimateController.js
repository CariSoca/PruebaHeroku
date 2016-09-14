// 
// Here is how to define your module 
// has dependent on mobile-angular-ui
// 
var app = angular.module('estimateApp', [
    'ngRoute',
    'mobile-angular-ui',
    // touch/drag feature: this is from 'mobile-angular-ui.gestures.js'
    // it is at a very beginning stage, so please be careful if you like to use
    // in production. This is intended to provide a flexible, integrated and and 
    // easy to use alternative to other 3rd party libs like hammer.js, with the
    // final pourpose to integrate gestures into default ui interactions like 
    // opening sidebars, turning switches on/off ..
    'mobile-angular-ui.gestures'
]);

app.run(function ($transform) {
    window.$transform = $transform;
});

// 
// You can configure ngRoute as always, but to take advantage of SharedState location
// feature (i.e. close sidebar on backbutton) you should setup 'reloadOnSearch: false' 
// in order to avoid unwanted routing.
// 
app.config(function ($routeProvider) {
    $routeProvider.when('/estimate', {templateUrl: 'estimate.html', reloadOnSearch: false});
});

// 
// `$touch example`
// 

app.directive('toucharea', ['$touch', function ($touch) {
        // Runs during compile
        return {
            restrict: 'C',
            link: function ($scope, elem) {
                $scope.touch = null;
                $touch.bind(elem, {
                    start: function (touch) {
                        $scope.touch = touch;
                        $scope.$apply();
                    },
                    cancel: function (touch) {
                        $scope.touch = touch;
                        $scope.$apply();
                    },
                    move: function (touch) {
                        $scope.touch = touch;
                        $scope.$apply();
                    },
                    end: function (touch) {
                        $scope.touch = touch;
                        $scope.$apply();
                    }
                });
            }
        };
    }]);

//
// `$drag` example: drag to dismiss
//
app.directive('dragToDismiss', function ($drag, $parse, $timeout) {
    return {
        restrict: 'A',
        compile: function (elem, attrs) {
            var dismissFn = $parse(attrs.dragToDismiss);
            return function (scope, elem) {
                var dismiss = false;

                $drag.bind(elem, {
                    transform: $drag.TRANSLATE_RIGHT,
                    move: function (drag) {
                        if (drag.distanceX >= drag.rect.width / 4) {
                            dismiss = true;
                            elem.addClass('dismiss');
                        } else {
                            dismiss = false;
                            elem.removeClass('dismiss');
                        }
                    },
                    cancel: function () {
                        elem.removeClass('dismiss');
                    },
                    end: function (drag) {
                        if (dismiss) {
                            elem.addClass('dismitted');
                            $timeout(function () {
                                scope.$apply(function () {
                                    dismissFn(scope);
                                });
                            }, 300);
                        } else {
                            drag.reset();
                        }
                    }
                });
            };
        }
    };
});

//
// Another `$drag` usage example: this is how you could create 
// a touch enabled "deck of cards" carousel. See `carousel.html` for markup.
//
app.directive('carousel', function () {
    return {
        restrict: 'C',
        scope: {},
        controller: function () {
            this.itemCount = 0;
            this.activeItem = null;

            this.addItem = function () {
                var newId = this.itemCount++;
                this.activeItem = this.itemCount === 1 ? newId : this.activeItem;
                return newId;
            };

            this.next = function () {
                this.activeItem = this.activeItem || 0;
                this.activeItem = this.activeItem === this.itemCount - 1 ? 0 : this.activeItem + 1;
            };

            this.prev = function () {
                this.activeItem = this.activeItem || 0;
                this.activeItem = this.activeItem === 0 ? this.itemCount - 1 : this.activeItem - 1;
            };
        }
    };
});

app.directive('carouselItem', function ($drag) {
    return {
        restrict: 'C',
        require: '^carousel',
        scope: {},
        transclude: true,
        template: '<div class="item"><div ng-transclude></div></div>',
        link: function (scope, elem, attrs, carousel) {
            scope.carousel = carousel;
            var id = carousel.addItem();

            var zIndex = function () {
                var res = 0;
                if (id === carousel.activeItem) {
                    res = 2000;
                } else if (carousel.activeItem < id) {
                    res = 2000 - (id - carousel.activeItem);
                } else {
                    res = 2000 - (carousel.itemCount - 1 - carousel.activeItem + id);
                }
                return res;
            };

            scope.$watch(function () {
                return carousel.activeItem;
            }, function () {
                elem[0].style.zIndex = zIndex();
            });

            $drag.bind(elem, {
                //
                // This is an example of custom transform function
                //
                transform: function (element, transform, touch) {
                    // 
                    // use translate both as basis for the new transform:
                    // 
                    var t = $drag.TRANSLATE_BOTH(element, transform, touch);

                    //
                    // Add rotation:
                    //
                    var Dx = touch.distanceX,
                            t0 = touch.startTransform,
                            sign = Dx < 0 ? -1 : 1,
                            angle = sign * Math.min((Math.abs(Dx) / 700) * 30, 30);

                    t.rotateZ = angle + (Math.round(t0.rotateZ));

                    return t;
                },
                move: function (drag) {
                    if (Math.abs(drag.distanceX) >= drag.rect.width / 4) {
                        elem.addClass('dismiss');
                    } else {
                        elem.removeClass('dismiss');
                    }
                },
                cancel: function () {
                    elem.removeClass('dismiss');
                },
                end: function (drag) {
                    elem.removeClass('dismiss');
                    if (Math.abs(drag.distanceX) >= drag.rect.width / 4) {
                        scope.$apply(function () {
                            carousel.next();
                        });
                    }
                    drag.reset();
                }
            });
        }
    };
});

app.directive('dragMe', ['$drag', function ($drag) {
        return {
            controller: function ($scope, $element) {
                $drag.bind($element,
                        {
                            //
                            // Here you can see how to limit movement 
                            // to an element
                            //
                            transform: $drag.TRANSLATE_INSIDE($element.parent()),
                            end: function (drag) {
                                // go back to initial position
                                drag.reset();
                            }
                        },
                {// release touch when movement is outside bounduaries
                    sensitiveArea: $element.parent()
                }
                );
            }
        };
    }]);

//
// For this trivial demo we have just a unique MainController 
// for everything
//
app.controller('MainController', function ($rootScope, $scope) {

    $scope.swiped = function (direction) {
        alert('Swiped ' + direction);
    };

    // User agent displayed in home page
    $scope.userAgent = navigator.userAgent;

    // Needed for the loading screen
    $rootScope.$on('$routeChangeStart', function () {
        $rootScope.loading = true;
    });

    $rootScope.$on('$routeChangeSuccess', function () {
        $rootScope.loading = false;
    });

    // Fake text i used here and there.
    $scope.lorem = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vel explicabo, aliquid eaque soluta nihil eligendi adipisci error, illum corrupti nam fuga omnis quod quaerat mollitia expedita impedit dolores ipsam. Obcaecati.';

    // 
    // 'Scroll' screen
    // 
    var scrollItems = [];

    for (var i = 1; i <= 100; i++) {
        scrollItems.push('Item ' + i);
    }

    $scope.scrollItems = scrollItems;

    $scope.bottomReached = function () {
        /* global alert: false; */
        alert('Congrats you scrolled to the end of the list!');
    };

    // 
    // Right Sidebar
    // 
    $scope.seriePuntuacion = [1,2,3,5,8,13,21];
    
    
    $scope.stories = [
        {id: 1, name: 'Log in con google', puntaje: 0, total : 0},
        {id: 2, name: 'Log in con facebook', puntaje: 0, total : 0},
        {id: 3, name: 'Hacer pantalla principal', puntaje: 0, total : 0},
        {id: 4, name: 'Hacer pantalla login', puntaje: 0, total : 0},
        {id: 5, name: 'Base de datos', puntaje: 0, total : 0},
        {id: 6, name: 'Historia 1', puntaje: 0, total : 0},
        {id: 7, name: 'Historia 2', puntaje: 0, total : 0}
    ];
    
    $scope.maxIdStory=8;
    
    $scope.historiaSeleccionada = $scope.stories[0].id;
    $scope.puntajeHistSel = $scope.stories[0].puntaje;
    
    $scope.nombreHistSel = $scope.stories[0].name;

    $scope.cambiarHistoria = function (xid) {
        $scope.historiaSeleccionada = xid;
        var found = $scope.stories.filter(function (xhistoria) {
            return xhistoria.id === xid
        });
        $scope.puntajeHistSel = found[0].puntaje;
        
        $scope.nombreHistSel = found[0].name;
        
    }
    $scope.siguienteHistoria = function (xpuntaje, xhistoriaSelec) {
        var found = $scope.stories.filter(function (xhistoria) {
            return xhistoria.id === xhistoriaSelec
        });
        found[0].puntaje = xpuntaje;
        if (xhistoriaSelec == ($scope.maxIdStory - 1)) {
             $scope.cambiarHistoria(1);
        } else {
             $scope.cambiarHistoria(xhistoriaSelec + 1);
        }

    }
    
    $scope.addStoryLabel=''
    
    $scope.devolverNombreHistoria = function () {
        var found = $scope.stories.filter(function (xhistoria) {
            return xhistoria.id === historiaSeleccionada
        });
        return found[0].name;
    };
    
    $scope.addStory = function (){
        $scope.stories.push({id:$scope.maxIdStory,name:document.getElementById("IDStory").value,puntaje:0});
        $scope.maxIdStory ++;
        $scope.addStoryLabel = '';
    };
    

    $scope.usuario="usuario@mooveit.com.uy"



    //
    // 'Forms' screen
    //  
    $scope.rememberMe = true;
    $scope.email = 'me@example.com';

    $scope.login = function () {
        alert('You submitted the login form');
    };

    // 
    // 'Drag' screen
    // 
    $scope.notices = [];

    for (var j = 0; j < 10; j++) {
        $scope.notices.push({icon: 'envelope', message: 'Notice ' + (j + 1)});
    }

    $scope.deleteNotice = function (notice) {
        var index = $scope.notices.indexOf(notice);
        if (index > -1) {
            $scope.notices.splice(index, 1);
        }
    };


});