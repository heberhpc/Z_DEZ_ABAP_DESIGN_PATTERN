*&---------------------------------------------------------------------*
*& Include z_strategy_classes
*&---------------------------------------------------------------------*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"MODE 1. INTERFACE ONLY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
INTERFACE cipher.
  METHODS: encode IMPORTING VALUE(in)  TYPE string
                  RETURNING VALUE(out) TYPE string.

  METHODS:decode IMPORTING VALUE(in)  TYPE string
                 RETURNING VALUE(out) TYPE string.

ENDINTERFACE.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS cryptograpgic_machine_1 DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES: cipher.
    METHODS: constructor IMPORTING mechanism TYPE REF TO cipher.
    METHODS: change_mechanism IMPORTING VALUE(param) TYPE REF TO cipher.

  PROTECTED SECTION.


  PRIVATE SECTION.
    DATA: mechanism TYPE REF TO cipher.

ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS cryptograpgic_machine_1 IMPLEMENTATION.

  METHOD cipher~decode.
    out = mechanism->decode( in ).
  ENDMETHOD.

  METHOD cipher~encode.
    out = mechanism->encode( in ).
  ENDMETHOD.

  METHOD constructor.
    me->mechanism = mechanism.
  ENDMETHOD.

  METHOD change_mechanism.
    me->mechanism = param.
  ENDMETHOD.

ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS concrete_cipher_a DEFINITION.
  PUBLIC SECTION.
    INTERFACES: cipher.

ENDCLASS.

CLASS concrete_cipher_a IMPLEMENTATION.

  METHOD cipher~encode.
    out = | concrete_cipher_a = encode : { in } |.
  ENDMETHOD.

  METHOD cipher~decode.
    out = | concrete_cipher_a = decode : { in } |.
  ENDMETHOD.

ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS concrete_cipher_b DEFINITION.
  PUBLIC SECTION.
    INTERFACES: cipher.

ENDCLASS.

CLASS concrete_cipher_b IMPLEMENTATION.

  METHOD cipher~encode.
    out = | concrete_cipher_b = encode : { in } |.
  ENDMETHOD.

  METHOD cipher~decode.
    out = | concrete_cipher_b = decode : { in } |.
  ENDMETHOD.

ENDCLASS.




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"MODE 2. ABSTRACT CLASS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS cipher_algorithm DEFINITION ABSTRACT.

  PUBLIC SECTION.
    METHODS: encode ABSTRACT IMPORTING VALUE(in)  TYPE string
                             RETURNING VALUE(out) TYPE string.

    METHODS: decode ABSTRACT IMPORTING VALUE(in)  TYPE string
                             RETURNING VALUE(out) TYPE string.

ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS cryptograpgic_machine_2 DEFINITION.

  PUBLIC SECTION.

    METHODS: constructor IMPORTING VALUE(algorithm) TYPE REF TO cipher_algorithm.

    METHODS: change_mechanism IMPORTING VALUE(algorithm) TYPE REF TO cipher_algorithm.

    METHODS: encode  IMPORTING VALUE(in)  TYPE string
                     RETURNING VALUE(out) TYPE string.

    METHODS: decode  IMPORTING VALUE(in)  TYPE string
                     RETURNING VALUE(out) TYPE string.

  PROTECTED SECTION.


  PRIVATE SECTION.

    DATA algorithm TYPE REF TO cipher_algorithm.

ENDCLASS.


CLASS cryptograpgic_machine_2 IMPLEMENTATION.

  METHOD constructor.
    me->change_mechanism( algorithm ).
  ENDMETHOD.

  METHOD change_mechanism.
    me->algorithm = algorithm.
  ENDMETHOD.


  METHOD encode.
    out = algorithm->encode( in ).
  ENDMETHOD.


  METHOD decode.
    out = algorithm->decode( in ).
  ENDMETHOD.

ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS concrete_cipher_algorithm_a DEFINITION INHERITING FROM cipher_algorithm.

  PUBLIC SECTION.
    METHODS: encode REDEFINITION.
    METHODS decode REDEFINITION.

ENDCLASS.

CLASS concrete_cipher_algorithm_a IMPLEMENTATION.

  METHOD encode.
    out = |concrete_cipher_algorithm_a : ENCODE : { in }|.
  ENDMETHOD.

  METHOD decode.
    out = |concrete_cipher_algorithm_a : DECODE : { in }|.
  ENDMETHOD.

ENDCLASS.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS concrete_cipher_algorithm_b DEFINITION INHERITING FROM cipher_algorithm.

  PUBLIC SECTION.
    METHODS: encode REDEFINITION.
    METHODS decode REDEFINITION.

ENDCLASS.

CLASS concrete_cipher_algorithm_b IMPLEMENTATION.

  METHOD encode.
    out = |concrete_cipher_algorithm_b : ENCODE : { in }|.
  ENDMETHOD.

  METHOD decode.
    out = |concrete_cipher_algorithm_b : DECODE : { in }|.
  ENDMETHOD.

ENDCLASS.
