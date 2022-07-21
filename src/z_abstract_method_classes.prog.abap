*&---------------------------------------------------------------------*
*& Include z_abstract_method_classes
*&---------------------------------------------------------------------*


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS motherboard DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS: get_description ABSTRACT RETURNING VALUE(description) TYPE string.
ENDCLASS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS asus_motherboard DEFINITION INHERITING FROM motherboard.
  PUBLIC SECTION.
    METHODS: get_description REDEFINITION.
ENDCLASS.
CLASS asus_motherboard IMPLEMENTATION.
  METHOD get_description.
    description = |Asus TUF GAMING B560M-PLUS, Intel LGA1200, microATX, DDR4 - 90MB1780-M0EAY0|.
  ENDMETHOD.
ENDCLASS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS gigabyte_motherboard DEFINITION INHERITING FROM motherboard.
  PUBLIC SECTION.
    METHODS: get_description REDEFINITION.
ENDCLASS.
CLASS gigabyte_motherboard IMPLEMENTATION.
  METHOD get_description.
    description = |Gigabyte B560M AORUS ELITE (rev. 1.0), LGA1200, Micro ATX, DDR4|.
  ENDMETHOD.
ENDCLASS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS processor DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS: get_description ABSTRACT RETURNING VALUE(description) TYPE string.
ENDCLASS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS i5_intel_processor DEFINITION INHERITING FROM processor.
  PUBLIC SECTION.
    METHODS: get_description REDEFINITION.
ENDCLASS.
CLASS i5_intel_processor IMPLEMENTATION.
  METHOD get_description.
    description = |Intel Core i5-10400, Cache 12MB, 2.9GHz (4.3GHz Max Turbo), LGA 1200 - BX8070110400|.
  ENDMETHOD.
ENDCLASS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS ryzen_amd_processor DEFINITION INHERITING FROM processor.
  PUBLIC SECTION.
    METHODS: get_description REDEFINITION.
ENDCLASS.
CLASS ryzen_amd_processor IMPLEMENTATION.
  METHOD get_description.
    description = |Processador AMD Ryzen 9 5950X, Cache 72MB, 3.4GHz (4.9GHz Max Turbo), AM4 - 100-100000059WOF|.
  ENDMETHOD.
ENDCLASS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS memory DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS: get_description ABSTRACT RETURNING VALUE(description) TYPE string.
ENDCLASS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS xpg_memory_d20 DEFINITION INHERITING FROM memory.
  PUBLIC SECTION.
    METHODS: get_description REDEFINITION.
ENDCLASS.
CLASS xpg_memory_d20  IMPLEMENTATION.
  METHOD get_description.
    description = |XPG Gammix D20 8GB, 3200MHz, DDR4, CL16, Preto - AX4U32008G16A-CBK20|.
  ENDMETHOD.
ENDCLASS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS xpg_memory_d45  DEFINITION INHERITING FROM memory.
  PUBLIC SECTION.
    METHODS: get_description REDEFINITION.
ENDCLASS.
CLASS xpg_memory_d45 IMPLEMENTATION.
  METHOD get_description.
    description = |XPG Gammix D45, 8GB, 3200MHz, DDR4, CL16, Preta - AX4U32008G16A-CBKD45|.
  ENDMETHOD.
ENDCLASS.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS storage DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS: get_description ABSTRACT RETURNING VALUE(description) TYPE string.
ENDCLASS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS ssd_240_storage  DEFINITION INHERITING FROM storage.
  PUBLIC SECTION.
    METHODS: get_description REDEFINITION.
ENDCLASS.
CLASS ssd_240_storage IMPLEMENTATION.
  METHOD get_description.
    description = |Kingston A400, 240GB, SATA, Leitura 500MB/s, Gravação 350MB/s - SA400S37/240G|.
  ENDMETHOD.
ENDCLASS.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS ssd_480_storage  DEFINITION INHERITING FROM storage.
  PUBLIC SECTION.
    METHODS: get_description REDEFINITION.
ENDCLASS.
CLASS ssd_480_storage IMPLEMENTATION.
  METHOD get_description.
    description = |Kingston A400, 480GB, SATA, Leitura 500MB/s, Gravação 450MB/s - SA400S37/480G|.
  ENDMETHOD.
ENDCLASS.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS computer_factory DEFINITION ABSTRACT.
  PUBLIC SECTION.
    METHODS: get_motherboard ABSTRACT RETURNING VALUE(motherboard) TYPE REF TO motherboard.
    METHODS: get_processor ABSTRACT RETURNING VALUE(processor) TYPE REF TO processor.
    METHODS: get_memory ABSTRACT RETURNING VALUE(memory) TYPE REF TO memory.
    METHODS: get_storage ABSTRACT RETURNING VALUE(storage) TYPE REF TO storage.
ENDCLASS.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS computer DEFINITION ABSTRACT.

  PUBLIC SECTION.
    METHODS: build_computer ABSTRACT.

    METHODS: get_full_description RETURNING VALUE(description) TYPE string.

  PROTECTED SECTION.
    DATA: motherboard TYPE REF TO motherboard,
          processor   TYPE REF TO processor,
          memory      TYPE REF TO memory,
          storage     TYPE REF TO storage.

ENDCLASS.
CLASS computer IMPLEMENTATION.
  METHOD get_full_description.

    description = | MOTHERDOARD : { motherboard->get_description( ) }, | &
                  | PROCESSOR : { processor->get_description( ) }, | &
                  | MEMORY : { memory->get_description( ) }, | &
                  | STORAGE : { storage->get_description( ) }. |.
  ENDMETHOD.
ENDCLASS.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS dell_computer_factory DEFINITION INHERITING FROM computer_factory.
  PUBLIC SECTION.
    METHODS: get_motherboard REDEFINITION.
    METHODS: get_processor REDEFINITION.
    METHODS: get_memory REDEFINITION.
    METHODS: get_storage REDEFINITION.
ENDCLASS.
CLASS dell_computer_factory IMPLEMENTATION.

  METHOD get_motherboard.
    motherboard = NEW asus_motherboard(  ).
  ENDMETHOD.

  METHOD get_processor.
    processor = NEW i5_intel_processor(  ).
  ENDMETHOD.

  METHOD get_memory.
    memory = NEW xpg_memory_d20( ).
  ENDMETHOD.

  METHOD get_storage.
    storage = NEW ssd_240_storage( ).
  ENDMETHOD.

ENDCLASS.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS dell_computer DEFINITION INHERITING FROM computer.
  PUBLIC SECTION.
    METHODS build_computer REDEFINITION.

    METHODS constructor IMPORTING VALUE(factory) TYPE REF TO computer_factory.



  PRIVATE SECTION.
    DATA factory TYPE REF TO computer_factory.

ENDCLASS.
CLASS dell_computer IMPLEMENTATION.
  METHOD  constructor.
    super->constructor( ).
    me->factory = factory.
  ENDMETHOD.

  METHOD build_computer.
    motherboard = factory->get_motherboard(  ).
    processor = factory->get_processor(  ).
    memory = factory->get_memory(  ).
    storage = factory->get_storage(  ).
  ENDMETHOD.

ENDCLASS.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
CLASS gamer_computer_factory DEFINITION INHERITING FROM computer_factory.
  PUBLIC SECTION.
    METHODS: get_motherboard REDEFINITION.
    METHODS: get_processor REDEFINITION.
    METHODS: get_memory REDEFINITION.
    METHODS: get_storage REDEFINITION.
ENDCLASS.
CLASS gamer_computer_factory IMPLEMENTATION.

  METHOD get_motherboard.
    motherboard = NEW gigabyte_motherboard( ).
  ENDMETHOD.

  METHOD get_processor.
    processor = NEW ryzen_amd_processor(  ).
  ENDMETHOD.

  METHOD get_memory.
    memory = NEW xpg_memory_d45( ).
  ENDMETHOD.

  METHOD get_storage.
    storage = NEW ssd_480_storage( ).
  ENDMETHOD.

ENDCLASS.
