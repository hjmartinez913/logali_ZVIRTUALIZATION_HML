CLASS zcl_virtual_discount_hml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_virtual_discount_hml IMPLEMENTATION.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

*    CASE iv_entity.
*
*      WHEN 'ZCDS_VIRTUAL_DISCOUNT_HML' OR
*           'ZCDS_PROJ_VIRTUAL_DISC_HML'.
*
*        LOOP AT it_requested_calc_elements INTO DATA(ls_req_calc_elem).
*          IF ls_req_calc_elem = 'PRICE'.
*            APPEND 'PRICE' TO et_requested_orig_elements.
*            APPEND 'CURRENCYCODE' TO et_requested_orig_elements.
*          ENDIF.
*        ENDLOOP.
*
*      WHEN OTHERS.
*
*    ENDCASE.

  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA lt_original_data TYPE STANDARD TABLE OF zcds_proj_virtual_disc_hml WITH DEFAULT KEY.

    lt_original_data = CORRESPONDING #( it_original_data ).

    loop at lt_original_data ASSIGNING FIELD-SYMBOL(<fs_orig_data>).
        case <fs_orig_data>-CurrencyCode.
            when 'EUR'.
                <fs_orig_data>-RealPrice = <fs_orig_data>-Price - ( <fs_orig_data>-Price * ( 1 / 10 ) ).
            when others.
                <fs_orig_data>-RealPrice = <fs_orig_data>-Price - ( <fs_orig_data>-Price * ( 5 / 100 ) ).
        endcase.
    endloop.

    ct_calculated_data = CORRESPONDING #( lt_original_data ).

  ENDMETHOD.

ENDCLASS.
