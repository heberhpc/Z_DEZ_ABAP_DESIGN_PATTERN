REPORT z_observer_lab.


INCLUDE z_classical_observer_pull_cl.
INCLUDE z_abap_event_observer_cl.

**********************************************************************
START-OF-SELECTION.

  PERFORM abap_event_observer.



END-OF-SELECTION.


**********************************************************************
FORM classical_obserser_push.
ENDFORM.


FORM classical_observer_pull.

  DATA(publisher1) = NEW sensor(  ).

  DATA(subscriber1) = NEW reader_a(  ).
  DATA(subscriber2) = NEW reader_a(  ).
  DATA(subscriber3) = NEW reader_a(  ).

  publisher1->add_subscriber( subscriber1 ).
  publisher1->add_subscriber( subscriber2 ).
  publisher1->add_subscriber( subscriber3 ).

  publisher1->set_sensor_temp('20.00').

ENDFORM.


FORM abap_event_observer.

  DATA(sub1) = NEW subject(  ).
  DATA(obs1) = NEW observer(  ).
  DATA(obs2) = NEW observer(  ).
  DATA(obs3) = NEW observer(  ).

  sub1->add_observer( obs1 ).
  sub1->set_status( 'CALL1' ).

  sub1->add_observer( obs2 ).
  sub1->set_status( 'CALL2' ).

  sub1->add_observer( obs3 ).
  sub1->set_status( 'CALL3' ).

  ULINE.


ENDFORM.
