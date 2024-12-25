@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Virtual Element- Proj Root Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zcds_proj_virtual_disc_hml
  provider contract transactional_query
  as projection on zcds_virtual_discount_hml
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied,
      @EndUserText. label: 'Real Price'
      @Semantics. amount. currencyCode: 'CurrencyCode'
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUAL_DISCOUNT_HML'
      virtual RealPrice : abap.curr( 16, 2 )
}
