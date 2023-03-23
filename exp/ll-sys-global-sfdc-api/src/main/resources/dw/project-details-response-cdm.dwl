%dw 2.0
import * from dw::core::Strings
output application/json  skipNullOn="everywhere"
---
{
  "projectId": payload.id,
  "phProjectId": payload.PLM_PublisherID__c,
  ("listingClientId" : payload.PLM_ListingClientID__c) if (payload.PLM_ListingClientID__c != null),
  "name" : payload.Name,
  ("yearBuild": payload.PLM_YearBuilt__c as Number) if (payload.PLM_YearBuilt__c != null), 
  ("noOfStreetParking": payload.PLM_NoOfOffStreetParking__c ) if (payload.PLM_NoOfOffStreetParking__c != null),
  "energyEfficiencyRating": payload.PLM_EnergyEfficiencyRating__c,
  ("newConstruction": payload.PLM_NewConstruction__c as Boolean) if ( payload.PLM_NewConstruction__c != null),
  "url": payload.PLM_PropertyURL__c,
  "address": {
    ("postcode": payload.PostalCode__c) if (payload.PostalCode__c != null),
    "state": payload.State__c,
    //"unitNumber": "",
    "longitude": payload.PLM_AddressGeolocation__Longitude__s,
    "suburb": payload.CitySuburb__c,
    ("streetNumber": substringBefore(payload.StreetAddress__c, " ") ) if (payload.StreetAddress__c != null),
    ("streetName": substringAfter(payload.StreetAddress__c, " ") ) if (payload.StreetAddress__c != null),
    "country": payload.Country__c,
    "latitude": payload.PLM_AddressGeolocation__Latitude__s,
  },
  "vitualTourURL": payload.PLM_VirtualTourURL__c,
  "videoURL": payload.PLM_VideoURL__c,
  "externalLink1": payload.PLM_ExternalLink1__c,
  "externalLink2": payload.PLM_ExternalLink2__c,
  "upcomingAuction": payload.PLM_UpcomingAuction__c,
  "auction": {
    "auctionDate": payload.PLM_AuctionDate__c,
    "auctionPlace": payload.PLM_AuctionPlace__c,
    "auctionTime": payload.PLM_AuctionTime__c
  }, 
  //"contact" : {
	  "email": payload.CustomerServiceEmail__c,
	  "phone" : payload.OfficePhone__c,
 
  "salesAuthority" : payload.PLM_SaleAuthority__c,
  "methodOfSales" : payload.PLM_MethodOfSale__c,
  "publishTo" : payload.PLM_PublishTo__c, 
  "publishToForAudit" : payload.PLM_SYS_PublishTo__c, 
  "listingAgentId" : payload.PLM_ListingAgentID__c,
  "listingLastSyncStatus" : payload.PLM_SYS_ListingLastSyncStatus__c,
  "listingLastSyncDateTime" : payload.PLM_SYS_ListingLastSyncDateTime__c
}
  