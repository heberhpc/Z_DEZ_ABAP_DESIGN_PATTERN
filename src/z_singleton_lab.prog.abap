REPORT z_singleton_lab.


INCLUDE z_singleton_classes.


**********************************************************************

DATA: singleton_instance1 TYPE REF TO singleton_v1,
      singleton_instance2 TYPE REF TO singleton_v1.

DATA: singleton_instance3 TYPE REF TO singleton_v2,
      singleton_instance4 TYPE REF TO singleton_v2.

**********************************************************************
START-OF-SELECTION.


  PERFORM test_version1.

  PERFORM test_version2.



END-OF-SELECTION.


**********************************************************************
FORM test_version2.
  ULINE.
  WRITE / 'TESTE VERSION 2'.

  "Test instances
  IF singleton_instance3 IS BOUND.
    WRITE: / | singleton_instance3 : {  singleton_instance3->get_login_data( ) } |.
  ELSE.
    WRITE: / | singleton_instance3 : NO INSTANCE|.
  ENDIF.

  IF singleton_instance4 IS BOUND.
    WRITE: / | singleton_instance4 : {  singleton_instance4->get_login_data( ) } |.
  ELSE.
    WRITE: / | singleton_instance4 : NO INSTANCE|.
  ENDIF.


  " instantiation using class_constructor
  singleton_instance3 = singleton_v2=>singleton_instance.
  singleton_instance4 = singleton_v2=>singleton_instance.


  "test again
  IF singleton_instance3 IS BOUND.
    WRITE: / | singleton_instance3 : {  singleton_instance3->get_login_data( ) } |.
  ELSE.
    WRITE: / | singleton_instance3 : NO INSTANCE|.
  ENDIF.

  IF singleton_instance4 IS BOUND.
    WRITE: / | singleton_instance4 : {  singleton_instance4->get_login_data( ) } |.
  ELSE.
    WRITE: / | singleton_instance4 : NO INSTANCE|.
  ENDIF.

  ULINE.
ENDFORM.



**********************************************************************
FORM test_version1.
  ULINE.
  WRITE / 'TESTE VERSION 1'.

  IF singleton_instance1 IS BOUND.
    WRITE: / | singleton_instance1 : {  singleton_instance1->get_login_data( ) } |.
  ELSE.
    WRITE: / | singleton_instance1 : NO INSTANCE|.
  ENDIF.

  IF singleton_instance2 IS BOUND.
    WRITE: / | singleton_instance2 : {  singleton_instance1->get_login_data( ) } |.
  ELSE.
    WRITE: / | singleton_instance2 : NO INSTANCE|.
  ENDIF.


  "instantiation.
  singleton_instance1 = singleton_v1=>get_instance( ).
  singleton_instance2 = singleton_v1=>get_instance( ).


  IF singleton_instance1 IS BOUND.
    WRITE: / | singleton_instance1 : {  singleton_instance1->get_login_data( ) } |.
  ELSE.
    WRITE: / | singleton_instance1 : NO INSTANCE|.
  ENDIF.

  IF singleton_instance2 IS BOUND.
    WRITE: / | singleton_instance2 : {  singleton_instance1->get_login_data( ) } |.
  ELSE.
    WRITE: / | singleton_instance2 : NO INSTANCE|.
  ENDIF.

  ULINE.
ENDFORM.
