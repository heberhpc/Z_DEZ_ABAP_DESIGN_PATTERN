*&---------------------------------------------------------------------*
*& Include z_free_lab_001_classes
*&---------------------------------------------------------------------*


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
INTERFACE cl_states.
  TYPES: state_value TYPE i.
  CONSTANTS: green  TYPE state_value VALUE 1,
             yellow TYPE state_value VALUE 2,
             red    TYPE state_value VALUE 3.
ENDINTERFACE.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

CLASS semaforo DEFINITION.

  PUBLIC SECTION.

    METHODS: constructor.

    METHODS:
      set_status IMPORTING VALUE(status) TYPE cl_states=>state_value,
      get_status RETURNING VALUE(status) TYPE cl_states=>state_value.

  PRIVATE SECTION.
    DATA status TYPE cl_states=>state_value.

ENDCLASS.
CLASS semaforo IMPLEMENTATION.

  METHOD constructor.
    me->status = cl_states=>red.
  ENDMETHOD.

  METHOD get_status.
    status = me->status.
  ENDMETHOD.

  METHOD set_status.
    me->status = status.
  ENDMETHOD.

ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
