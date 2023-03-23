%dw 2.0
import * from dw::core::Arrays

fun status2CDM(sfdcId) =
	sfdcId match {
		case 1 -> "Pipeline"
		case 2 -> "Released"
		case 3 -> "Settled"
		case 4 -> "Sold"
		case 5 -> "Sold/Exchanged"
		case 6 -> "Unreleased"
		case 7 -> "Cancelled"
		case 8 -> "Not For Sale"
	}
	
fun displayPrice2CDM(sfdcValue) =
	sfdcValue match {
		case 1 -> "none"
		case 2 -> "price text"
		case 3 -> "dollar price"
		case "" -> null
	}	
// used for Media and Inspection times
fun setCollateralAssociation(productId) =
	if (productId == "") 
		"project"
	else
		"product"
	  

fun setDeleteFlag(deleteStatus) = 
	if (deleteStatus == "Pending")
		true
	else
		false

fun transformDeleteFlagToSFDC(flag) =
	if (flag == true)
		"Deleted"
	else
		"Pending"		

fun transformFromBooloanToSFDC(value) =
	if (value == true) 
		"Yes"
	else 
		"No"		
		
fun transformSFDCtoBoolean(value) = 
	if (value == "Yes")
		true
	else 
		false

fun getSyncMessage(message)=
	if (message == null or sizeOf(message) < 1)
		' '
    else if((typeOf(message) as String) == "Object") 
        write(message, "application/json") as String 
    else 
        message as String		


/* proc function */

fun dwellingStatus(statusType) =
	statusType match {
		case "Occupied No Notice" -> "Occupied No Notice"
		case "Vacant Unrented Not Ready" -> "Vacant Unrented - Not Ready"
		case "Vacant Unrented Ready" -> "Vacant Unrented - Ready"
		case "Vacant Rented Ready" -> " Vacant Rented"
		case "Notice Unrented" -> "Notice Unrented"
		case "Vacant Rented Not Ready" -> "Vacant Rented - Not Ready "
		case "Notice Rented" -> "Notice Rented"
		case "Down" -> "Down"
		case "Model" -> "Model"
		else -> ""
	}

fun furnitureType(item) = 
	item match {
		case "False" -> "Not Furnished"
		case "Aspect" -> "Furnished"
		case "Edge" -> "Furnished"
		else -> ""
	}	
	
fun balconyType(item) =
	item match {
		case "Balcony-Double" -> "Double Balcony"
		case "Balcony-Large" -> "Large Balcony"
		case "Balcony-Standard" -> "Standard Balcony"
		case "Terrace" -> "Terrace"
		case "Terrace-Standard" -> "Standard Terrace"
		case "Terrace-Large" -> "Large Terrace"
		case "Wraparound" -> "Wraparound Terrace"
		case "Double Terrace" -> "Being Added to List"
		case "Balcony-Standard; Terrace-Std" -> "Standard Balcony AND Standard Terrace"
		case "Terrace-Large; Terrace-Std" -> "Large Terrace AND Standard Terrace"
		else -> ""
	}

fun partOrCityView(item) = 
	item match {
		case "View-Park" -> "View-Park"
		case "View-City" -> "View-City"
		case "View-Garden" -> "View-Garden"
		else -> ""
	}	
	
fun buildingLocation(item) =
	item match {
		case "Level 5-15" -> "Level 5-15; Lower Floor"
		case "Level 16-23" -> "Level 16-23; Higher Floor"
		case "Top Floor" -> "Top Floor"
		case "Penthouse" -> "Penthouse"
		else -> ""
	}	
	
fun opportunityStatus(status) =	
	status match {
		case "1" -> "Applied"
		case "2" -> "Approved"
		case "3" -> "Closed Lost"
		case "4" -> "Closed Lost"
		case "5" -> "Denied"
		case "6" -> "Applicant"
		case "7" -> "Resident"
		else -> ""
	}
	
fun contactRole(role) =
	role match {
		case "Spouse/Partner" -> "Guarantor"
		case "Roommate" -> "Co-Lessee"
		case "Other" -> "Other"
		case "Spouse/Partner" -> "Co-Lessee"
		case "Corporate/Friends" -> "Corporate"
		case "Father" -> "Co-Lessee"
		case "Mother" -> "Co-Lessee"
		case "Son" -> "Co-Lessee"
		case "Daughter" -> "Co-Lessee"
		else  -> ""
	}

fun leaseStatus(status) =
	status match {
		case "0" -> "Current"
		case "1" -> "Past"
		case "2" -> "Future"
		case "3" -> "Past"
		case "4" -> "Notice"
		case "7" -> "Lease Lost"
		else -> ""
	}	

fun hedRelationship(relType) =
	relType match { 
		case "Spouse/Partner" -> "Partner"
		case "Father" -> "Father"
		case "Mother" -> "Mother"
		case "Son" -> "Son"
		case "Daughter" -> "Daughter"
		else -> ""
	}	
        