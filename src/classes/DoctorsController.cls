/**
 * @agarciaodeian
 */

global with sharing class DoctorsController
{
	global DoctorsController(ApexPages.StandardController controller)
    {
    }
    
	public Map<String,Double> getDoctorsCenter()
    {
        Map<String,Double> mapCenter = new Map<String,Double>
        {
            'latitude' => 43.2616465,
			'longitude' => -2.9393368
        };
        
        return mapCenter;
    }
    
    @RemoteAction
    global static Doctor__c findTheDoctor(Id recordId)
    {
		Id theDoctorId = recordId;
        return [Select Id, SurgeryName__c, Location__Latitude__s, Location__Longitude__s 
                From Doctor__c 
                Where Id = :theDoctorId
                Limit 1];
    }
}