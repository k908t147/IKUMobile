//
//  EventHelper.swift
//  IKUMobile
//
//  Created by Luis Chachayma on 4/30/17.
//  Copyright © 2017 Keshawn Triplett. All rights reserved.
//

import Foundation
import EventKit
class EventHelper
{
    let appleEventStore = EKEventStore()
    var calendars: [EKCalendar]?
    //var InfoEvent
    func generateEvent() {
        let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
        
        switch (status)
        {
        case EKAuthorizationStatus.notDetermined:
            // This happens on first-run
            requestAccessToCalendar()
        case EKAuthorizationStatus.authorized:
            // User has access
            print("User has access to calendar")
            //self.addAppleEvents()
        case EKAuthorizationStatus.restricted, EKAuthorizationStatus.denied:
            // We need to help them give us permission
            noPermission()
        }////
    }
    func noPermission()
    {
        print("User has to change settings...goto settings to view access")
    }
    func requestAccessToCalendar() {
        appleEventStore.requestAccess(to: .event, completion: { (granted, error) in
            if (granted) && (error == nil) {
                DispatchQueue.main.async {
                    print("User has access to calendar")
                    //self.addAppleEvents()
                }
            } else {
                DispatchQueue.main.async{
                    self.noPermission()
                }
            }
        })
    }
    func addAppleEvents(Type: String, Name: String, Sequence: String,Location: String, StartHour: String, EndHour: String)
    {
        if Type=="0" {
            var Monday = Sequence[Sequence.index(Sequence.startIndex, offsetBy:0)]
            print(Monday)
            var Tuesday = Sequence[Sequence.index(Sequence.startIndex, offsetBy:1)]
            print(Tuesday)
            var Wednesday = Sequence[Sequence.index(Sequence.startIndex, offsetBy:2)]
            print(Wednesday)
            var Thursday = Sequence[Sequence.index(Sequence.startIndex, offsetBy:3)]
            print(Thursday)
            var Friday = Sequence[Sequence.index(Sequence.startIndex, offsetBy:4)]
            print(Friday)
        
            if Monday=="1" {
          
                let event:EKEvent = EKEvent(eventStore: appleEventStore)
                event.title = Name
                let StartHour24H = amAppend(str: StartHour)
                let EndHour24H = amAppend(str: EndHour)
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                
                let StartDateF = dateformatter.date(from: "2017-05-01T"+StartHour24H)///
                event.startDate =  StartDateF! as Date
                let endDateF = dateformatter.date(from: "2017-05-01T"+EndHour24H)
                event.endDate =  endDateF! as Date
                event.notes = "KU Calendar"
                event.calendar = appleEventStore.defaultCalendarForNewEvents
                do {
                    try appleEventStore.save(event, span: .thisEvent)
                //print("events added with dates:")
                } catch let e as NSError {
                    print(e.description)
                    return
                }
                
                let StartDateF = dateformatter.date(from: "2017-05-08T"+StartHour24H)
                event.startDate =  StartDateF! as Date
                let endDateF = dateformatter.date(from: "2017-05-08T"+EndHour24H)
                event.endDate =  endDateF! as Date
                event.notes = "KU Calendar"
                event.calendar = appleEventStore.defaultCalendarForNewEvents
                appleEventStore.save(event, span: .thisEvent)
            }
                
                
                
                
                
                
            
                
                
                
                
                
                
                
                
                
            

        
        }
        
        
        //print("Saved Event")
    }
    
    
    
    
    func amAppend(str:String) -> String{ //12 to 24 hour formatt
        var temp = str
        var strArr = str.characters.split{$0 == ":"}.map(String.init)
        var hour = Int(strArr[0])!
        
        var strArr2 = strArr[1].characters.split{$0 == " "}.map(String.init)
        var min = Int(strArr2[0])!
        if(strArr2[1] == "PM"){
            hour = hour + 12
        }
        if(min<10){
          return String(hour)+":0"+String(min)+":"+"00-0500"
        }
        else{
          return String(hour)+":"+String(min)+":"+"00-0500"
        }
        
        
    }
}
