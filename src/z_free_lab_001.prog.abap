REPORT z_free_lab_001.
**********************************************************************


INCLUDE z_free_lab_001_classes.


**********************************************************************
START-OF-SELECTION.


  DATA(c1) = NEW semaforo(  ).


  c1->set_status( cl_states=>red ).
  c1->set_status( cl_states=>green ).


  ULINE.



END-OF-SELECTION.
