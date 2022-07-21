*&---------------------------------------------------------------------*
*& Include z_factory_method_classes
*&---------------------------------------------------------------------*
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS car DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS: get_model ABSTRACT RETURNING VALUE(model) TYPE string.
    METHODS: get_cor ABSTRACT RETURNING VALUE(cor) TYPE string.
ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS ford_fiesta DEFINITION INHERITING FROM car.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING VALUE(cor) TYPE string.
    METHODS: get_model REDEFINITION.
    METHODS: get_cor REDEFINITION.

  PRIVATE SECTION.
    DATA model TYPE string.
    DATA cor TYPE string.

ENDCLASS.
CLASS ford_fiesta IMPLEMENTATION.

  METHOD: constructor.
    super->constructor(  ).
    me->model = 'FORD FIESTA HATCH 2.0'.
    me->cor = cor.
  ENDMETHOD.

  METHOD: get_model.
    model = me->model.
  ENDMETHOD.

  METHOD: get_cor.
    cor = me->cor.
  ENDMETHOD.


ENDCLASS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS ford_camaro DEFINITION INHERITING FROM car.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING VALUE(cor) TYPE string.
    METHODS: get_model REDEFINITION.
    METHODS: get_cor REDEFINITION.

  PRIVATE SECTION.
    DATA model TYPE string.
    DATA cor TYPE string.


ENDCLASS.
CLASS ford_camaro IMPLEMENTATION.

  METHOD: constructor.
    super->constructor(  ).
    me->model = 'FORD CAMARO 4.0'.
    me->cor = cor.
  ENDMETHOD.

  METHOD: get_model.
    model = me->model.
  ENDMETHOD.

  METHOD: get_cor.
    cor = me->cor.
  ENDMETHOD.

ENDCLASS.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS car_factory DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS: make_car ABSTRACT IMPORTING VALUE(categoria) TYPE string
                                         VALUE(cor)       TYPE string
                               RETURNING VALUE(car)       TYPE REF TO car.
ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS ford_car_factory DEFINITION INHERITING FROM car_factory.
  PUBLIC SECTION.
    METHODS: make_car REDEFINITION.
ENDCLASS.
CLASS ford_car_factory IMPLEMENTATION.

  METHOD make_car.

    CASE categoria.
      WHEN 'HATCH'.
        car = NEW ford_fiesta( cor = cor ).

      WHEN 'SPORT'.
        car = NEW ford_camaro( cor = cor ).

      WHEN OTHERS.

    ENDCASE.

  ENDMETHOD.

ENDCLASS.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS vw_gol DEFINITION INHERITING FROM car.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING VALUE(cor) TYPE string.
    METHODS: get_model REDEFINITION.
    METHODS: get_cor REDEFINITION.

  PRIVATE SECTION.
    DATA model TYPE string.
    DATA cor TYPE string.

ENDCLASS.
CLASS vw_gol IMPLEMENTATION.

  METHOD: constructor.
    super->constructor(  ).
    me->model = 'VOLKSWAGEN GOL 2.0'.
    me->cor = cor.
  ENDMETHOD.

  METHOD: get_model.
    model = me->model.
  ENDMETHOD.

  METHOD: get_cor.
    cor = me->cor.
  ENDMETHOD.


ENDCLASS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS vw_golf_gti DEFINITION INHERITING FROM car.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING VALUE(cor) TYPE string.
    METHODS: get_model REDEFINITION.
    METHODS: get_cor REDEFINITION.

  PRIVATE SECTION.
    DATA model TYPE string.
    DATA cor TYPE string.


ENDCLASS.
CLASS vw_golf_gti IMPLEMENTATION.

  METHOD: constructor.
    super->constructor(  ).
    me->model = 'VOLKSWAGEN GOLF GTI'.
    me->cor = cor.
  ENDMETHOD.

  METHOD: get_model.
    model = me->model.
  ENDMETHOD.

  METHOD: get_cor.
    cor = me->cor.
  ENDMETHOD.

ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS vw_car_factory DEFINITION INHERITING FROM car_factory.
  PUBLIC SECTION.
    METHODS: make_car REDEFINITION.
ENDCLASS.
CLASS vw_car_factory IMPLEMENTATION.

  METHOD make_car.

    CASE categoria.
      WHEN 'HATCH'.
        car = NEW vw_gol( cor = cor ).

      WHEN 'SPORT'.
        car = NEW vw_golf_gti( cor = cor ).

      WHEN OTHERS.

    ENDCASE.

  ENDMETHOD.

ENDCLASS.
