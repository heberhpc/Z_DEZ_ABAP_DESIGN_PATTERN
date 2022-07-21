REPORT z_factory_lab.
**********************************************************************

INCLUDE z_simple_factory_classes.
INCLUDE z_factory_method_classes.
INCLUDE z_abstract_method_classes.



**********************************************************************
START-OF-SELECTION.

  DATA(factory_1) = NEW dell_computer_factory( ).
  DATA(computer_1) = NEW dell_computer( factory_1 ).
  computer_1->build_computer( ).
  DATA(descr_1) = computer_1->get_full_description( ).

  DATA(factory_2) = NEW gamer_computer_factory( ).
  DATA(computer_2) = NEW dell_computer( factory_2 ).
  computer_2->build_computer( ).
  DATA(descr_2) = computer_2->get_full_description( ).

  "Alteração teste
  ULINE.







END-OF-SELECTION.


**********************************************************************
FORM simple_factory_2.

  DATA(pizza) = pizza_factory=>make_pizza( 'CALABRESA' ).
  ULINE.

ENDFORM.


FORM factory_method.

  DATA: car1 TYPE REF TO car,
        car2 TYPE REF TO car.

  DATA(factory_1) = NEW ford_car_factory(  ).
  car1 = factory_1->make_car( categoria = 'SPORT'  cor = 'AMARELO').
  car2 = factory_1->make_car( categoria = 'HATCH'  cor = 'BRANCO').

  WRITE: / |FORD FACTORY|.
  WRITE: / |MODEL SPORT: { car1->get_model(  ) } & COR { car1->get_cor(  ) } |.
  WRITE: / |MODEL HATCH: { car2->get_model(  ) } & COR { car2->get_cor(  ) } |.



  ULINE.


  DATA: car3 TYPE REF TO car,
        car4 TYPE REF TO car.

  DATA(factory_2) = NEW vw_car_factory(  ).
  car3 = factory_2->make_car( categoria = 'SPORT'  cor = 'AMARELO').
  car4 = factory_2->make_car( categoria = 'HATCH'  cor = 'BRANCO').

  WRITE: / |VOLKSWAGEN FACTORY|.
  WRITE: / |MODEL SPORT: { car3->get_model(  ) } & COR { car3->get_cor(  ) } |.
  WRITE: / |MODEL HATCH: { car4->get_model(  ) } & COR { car4->get_cor(  ) } |.

ENDFORM.
