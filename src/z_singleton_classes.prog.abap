*&---------------------------------------------------------------------*
*& Include z_singleton_classes
*&---------------------------------------------------------------------*

**********************************************************************
"SINGLETON V1
CLASS singleton_v1 DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    METHODS:constructor.
    CLASS-METHODS: get_instance RETURNING VALUE(r_instance) TYPE REF TO singleton_v1.
    METHODS: get_login_data RETURNING VALUE(r_logindata) TYPE string.
    METHODS: setup_data.


  PROTECTED SECTION.


  PRIVATE SECTION.
    CLASS-DATA: singleton_instance TYPE REF TO singleton_v1.
    DATA: timestamp_longo TYPE timestampl.
    DATA: logindata TYPE string.


ENDCLASS.

CLASS singleton_v1 IMPLEMENTATION.

  METHOD constructor.
    me->setup_data(  ).
  ENDMETHOD.


  METHOD get_instance.
    "check if there is already a instance.
    IF singleton_instance IS BOUND.
      "yes : return that instance.
      r_instance = singleton_instance.
    ELSE.
      "not: create the instance and return it.
      CREATE OBJECT singleton_instance.
      r_instance = singleton_instance.
    ENDIF.
  ENDMETHOD.


  METHOD get_login_data.
    r_logindata = logindata.
  ENDMETHOD.


  METHOD setup_data.
    GET TIME STAMP FIELD timestamp_longo.
    logindata = |User: { sy-uname } - TIMESTAMP : { timestamp_longo } |.
  ENDMETHOD.

ENDCLASS.

**********************************************************************
"SINGLETON V1
CLASS singleton_v2 DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-DATA: singleton_instance TYPE REF TO singleton_v2 READ-ONLY.
    CLASS-METHODS: class_constructor.
    METHODS: setup_data.
    METHODS: get_login_data RETURNING VALUE(r_logindata) TYPE string.


  PROTECTED SECTION.


  PRIVATE SECTION.
    DATA: timestamp_longo TYPE timestampl.
    DATA: logindata TYPE string.



ENDCLASS.

CLASS singleton_v2 IMPLEMENTATION.

  METHOD class_constructor.
    CREATE OBJECT singleton_v2=>singleton_instance.
    singleton_v2=>singleton_instance->setup_data(  ).
  ENDMETHOD.


  METHOD setup_data.
    GET TIME STAMP FIELD timestamp_longo.
    logindata = |User: { sy-uname } - TIMESTAMP : { timestamp_longo } |.
  ENDMETHOD.


  METHOD get_login_data.
    r_logindata = logindata.
  ENDMETHOD.


ENDCLASS.
