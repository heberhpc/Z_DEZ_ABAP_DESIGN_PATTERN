REPORT z_strategy_lab.


INCLUDE z_strategy_classes.


**********************************************************************
START-OF-SELECTION.


*  PERFORM strategy_test1.


  PERFORM strategy_test2.

END-OF-SELECTION.


**********************************************************************
FORM strategy_test1.

  DATA: encoder_1 TYPE REF TO cryptograpgic_machine_1.


  encoder_1 = NEW cryptograpgic_machine_1( NEW concrete_cipher_a(  ) ).
  WRITE: / encoder_1->cipher~encode( 'Testing encode a' ).
  WRITE: / encoder_1->cipher~decode( 'Testing decode a' ).

  encoder_1->change_mechanism( NEW concrete_cipher_b(  ) ).
  WRITE: / encoder_1->cipher~encode( 'Testing encode b' ).
  WRITE: / encoder_1->cipher~decode( 'Testing decode b' ).

ENDFORM.


**********************************************************************
FORM strategy_test2.

  DATA: encoder_1 TYPE REF TO cryptograpgic_machine_2.

  encoder_1 =  NEW cryptograpgic_machine_2( NEW concrete_cipher_algorithm_a(  ) ).
  WRITE: / encoder_1->encode( 'cryptograpgic_machine_2' ).
  WRITE: / encoder_1->decode( 'cryptograpgic_machine_2' ).

  ULINE.

  encoder_1->change_mechanism( NEW concrete_cipher_algorithm_b(  ) ).
  WRITE: / encoder_1->encode( 'cryptograpgic_machine_2' ).
  WRITE: / encoder_1->decode( 'cryptograpgic_machine_2' ).

ENDFORM.
