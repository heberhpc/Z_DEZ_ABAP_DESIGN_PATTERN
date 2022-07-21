*&---------------------------------------------------------------------*
*& Include z_abap_event_observer_cl
*&---------------------------------------------------------------------*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS observer DEFINITION DEFERRED .
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS subject DEFINITION.
  PUBLIC SECTION.
    EVENTS: change_status EXPORTING VALUE(subject) TYPE REF TO subject.

    METHODS:
      set_status IMPORTING VALUE(status) TYPE string,
      get_status RETURNING VALUE(status) TYPE string,


      add_observer IMPORTING VALUE(obs) TYPE REF TO observer.

  PRIVATE SECTION.
    DATA: status TYPE string.

ENDCLASS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS observer DEFINITION.
  PUBLIC SECTION.
    METHODS: change_status_handler FOR EVENT change_status OF subject IMPORTING subject.

  PRIVATE SECTION.
    DATA: list_status TYPE STANDARD TABLE OF string.

ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS subject IMPLEMENTATION.

  METHOD set_status.
    me->status = status.
    RAISE EVENT change_status EXPORTING subject = me.
  ENDMETHOD.

  METHOD get_status.
    status = me->status.
  ENDMETHOD.

  METHOD add_observer.
    SET HANDLER obs->change_status_handler FOR me.
  ENDMETHOD.

ENDCLASS.




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS observer IMPLEMENTATION.

  METHOD change_status_handler.
    APPEND subject->get_status(  ) TO list_status.
  ENDMETHOD.

ENDCLASS.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
