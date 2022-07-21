*&---------------------------------------------------------------------*
*& Include z_classical_observer_pull_cl
*&---------------------------------------------------------------------*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
INTERFACE publisher DEFERRED .


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
INTERFACE subscriber.
  METHODS: update IMPORTING VALUE(publisher) TYPE REF TO publisher.
ENDINTERFACE.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
INTERFACE publisher.

  TYPES ty_temperatura TYPE p LENGTH 5 DECIMALS 2.

  METHODS:
    "OBSERVER METHODS
    add_subscriber IMPORTING VALUE(subscriber) TYPE REF TO subscriber,
    remove_subscriber IMPORTING VALUE(subscriber) TYPE REF TO subscriber,
    notify_subscriber,

    "PULL METHODS
    set_sensor_temp IMPORTING VALUE(temperatura) TYPE ty_temperatura,
    get_sensor_temp RETURNING VALUE(temperatura) TYPE ty_temperatura.

ENDINTERFACE.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS sensor DEFINITION.
  PUBLIC SECTION.

    INTERFACES: publisher.
    ALIASES:
        add_subscriber    FOR publisher~add_subscriber,
        remove_subscriber FOR publisher~remove_subscriber,
        notify_subscriber FOR publisher~notify_subscriber,
        set_sensor_temp FOR publisher~set_sensor_temp,
        get_sensor_temp FOR publisher~get_sensor_temp.

  PROTECTED SECTION.

  PRIVATE SECTION.

    DATA: list_of_subscribers TYPE STANDARD TABLE OF REF TO subscriber.

    DATA: sensor_temp TYPE publisher=>ty_temperatura.

ENDCLASS.

CLASS sensor IMPLEMENTATION.

  METHOD add_subscriber.
    APPEND subscriber TO list_of_subscribers.
  ENDMETHOD.


  METHOD notify_subscriber.
    LOOP AT list_of_subscribers INTO DATA(current_sub).
      current_sub->update( me ).
    ENDLOOP.
  ENDMETHOD.


  METHOD remove_subscriber.
    DELETE list_of_subscribers WHERE table_line = subscriber.
  ENDMETHOD.

  METHOD set_sensor_temp.
    me->sensor_temp = temperatura.
    me->notify_subscriber(  ).
  ENDMETHOD.

  METHOD get_sensor_temp.
    temperatura = me->sensor_temp.
  ENDMETHOD.

ENDCLASS.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS reader_a DEFINITION.
  PUBLIC SECTION.
    INTERFACES: subscriber.
    ALIASES: update FOR subscriber~update.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA: temperatura TYPE publisher=>ty_temperatura.

ENDCLASS.

CLASS reader_a IMPLEMENTATION.

  METHOD update.
    me->temperatura = publisher->get_sensor_temp(  ).
  ENDMETHOD.

ENDCLASS.



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
