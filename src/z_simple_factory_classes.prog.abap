*&---------------------------------------------------------------------*
*& Include z_simple_factory_classes
*&---------------------------------------------------------------------*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS abstract_pizza DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS get_sabor ABSTRACT RETURNING VALUE(s) TYPE string .
ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS pizza_calabresa DEFINITION INHERITING FROM abstract_pizza.
  PUBLIC SECTION.
    METHODS constructor.
    METHODS get_sabor REDEFINITION.

  PRIVATE SECTION.
    DATA sabor TYPE string.

ENDCLASS.

CLASS pizza_calabresa IMPLEMENTATION.

  METHOD constructor.
    super->constructor(  ).
    me->sabor = 'CALABRESA'.
  ENDMETHOD.

  METHOD get_sabor.
    sabor = me->sabor.
  ENDMETHOD.
ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS pizza_chesse DEFINITION INHERITING FROM abstract_pizza.
  PUBLIC SECTION.
    METHODS constructor.
    METHODS get_sabor REDEFINITION.

  PRIVATE SECTION.
    DATA sabor TYPE string.

ENDCLASS.

CLASS pizza_chesse IMPLEMENTATION.

  METHOD constructor.
    super->constructor(  ).
    me->sabor = 'CHESSE'.
  ENDMETHOD.

  METHOD get_sabor.
    sabor = me->sabor.
  ENDMETHOD.
ENDCLASS.



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS pizza_portuguesa DEFINITION INHERITING FROM abstract_pizza.
  PUBLIC SECTION.
    METHODS constructor.
    METHODS get_sabor REDEFINITION.

  PRIVATE SECTION.
    DATA sabor TYPE string.

ENDCLASS.

CLASS pizza_portuguesa IMPLEMENTATION.

  METHOD constructor.
    super->constructor(  ).
    me->sabor = 'PORTUGUESA'.
  ENDMETHOD.

  METHOD get_sabor.
    sabor = me->sabor.
  ENDMETHOD.
ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS pizza_factory DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS: make_pizza IMPORTING VALUE(sabor) TYPE string
                              RETURNING VALUE(pizza) TYPE REF TO abstract_pizza.


ENDCLASS.
CLASS pizza_factory IMPLEMENTATION.

  METHOD make_pizza.

    CASE sabor.

      WHEN 'CALABRESA'.
        pizza = NEW pizza_calabresa(  ).
      WHEN 'CHESSE'.
        pizza = NEW pizza_chesse(  ).
      WHEN 'PORTUGUESA'.
        pizza = NEW pizza_portuguesa(  ).
    ENDCASE.

  ENDMETHOD.

ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS pizzaorder DEFINITION.
  PUBLIC SECTION.
    METHODS: order_pizza IMPORTING VALUE(sabor) TYPE string
                         RETURNING VALUE(pizza) TYPE REF TO abstract_pizza.

ENDCLASS.
CLASS pizzaorder IMPLEMENTATION.

  METHOD order_pizza.
    DATA(factory) = NEW pizza_factory(  ).
    pizza = factory->make_pizza( sabor ).
  ENDMETHOD.

ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
