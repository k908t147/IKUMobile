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
        ///////////////
            if Monday=="1" {
                let event:EKEvent = EKEvent(eventStore: appleEventStore)
                event.title = Name
                let MoStartHour24H = amAppend(str: StartHour)
                let MoEndHour24H = amAppend(str: EndHour)
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                
                let MoStartDateF = dateformatter.date(from: "2017-05-01T"+MoStartHour24H)///
                event.startDate =  MoStartDateF! as Date
                let MoendDateF = dateformatter.date(from: "2017-05-01T"+MoEndHour24H)
                event.endDate =  MoendDateF! as Date
                event.notes = "KU Calendar"
                event.calendar = appleEventStore.defaultCalendarForNewEvents
                do {
                    try appleEventStore.save(event, span: .thisEvent)
                    //print("events added with dates:")
                } catch let e as NSError {
                    print(e.description)
                    return
                }
                /*
                let MoStartDateF1 = dateformatter.date(from: "2017-05-08T"+MoStartHour24H)
                event.startDate =  MoStartDateF1! as Date
                let MoendDateF1 = dateformatter.date(from: "2017-05-08T"+MoEndHour24H)
                event.endDate =  MoendDateF1! as Date
                event.notes = "KU Calendar"
                event.calendar = appleEventStore.defaultCalendarForNewEvents
                do {
                    try appleEventStore.save(event, span: .thisEvent)
                    //print("events added with dates:")
                } catch let e as NSError {
                    print(e.description)
                    return
                }
                */
            }
            ///////////////////////////
            if Tuesday=="1" {
                let event:EKEvent = EKEvent(eventStore: appleEventStore)
                event.title = Name
                let TuStartHour24H = amAppend(str: StartHour)
                let TuEndHour24H = amAppend(str: EndHour)
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                
                let TuStartDateF = dateformatter.date(from: "2017-05-02T"+TuStartHour24H)///
                event.startDate =  TuStartDateF! as Date
                let TuendDateF = dateformatter.date(from: "2017-05-02T"+TuEndHour24H)
                event.endDate =  TuendDateF! as Date
                event.notes = "KU Calendar"
                event.calendar = appleEventStore.defaultCalendarForNewEvents
                do {
                    try appleEventStore.save(event, span: .thisEvent)
                    //print("events added with dates:")
                } catch let e as NSError {
                    print(e.description)
                    return
                }
                /*
                let TuStartDateF1 = dateformatter.date(from: "2017-05-09T"+TuStartHour24H)
                event.startDate =  TuStartDateF1! as Date
                let TuendDateF1 = dateformatter.date(from: "2017-05-09T"+TuEndHour24H)
                event.endDate =  TuendDateF1! as Date
                event.notes = "KU Calendar"
                event.calendar = appleEventStore.defaultCalendarForNewEvents
                do {
                    try appleEventStore.save(event, span: .thisEvent)
                    //print("events added with dates:")
                } catch let e as NSError {
                    print(e.description)
                    return
                }*/
            }
            ///////////////////////////
            if Wednesday=="1" {
                let event:EKEvent = EKEvent(eventStore: appleEventStore)
                event.title = Name
                let WeStartHour24H = amAppend(str: StartHour)
                let WeEndHour24H = amAppend(str: EndHour)
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                
                let WeStartDateF = dateformatter.date(from: "2017-05-03T"+WeStartHour24H)///
                event.startDate =  WeStartDateF! as Date
                let WeendDateF = dateformatter.date(from: "2017-05-03T"+WeEndHour24H)
                event.endDate =  WeendDateF! as Date
                event.notes = "KU Calendar"
                event.calendar = appleEventStore.defaultCalendarForNewEvents
                do {
                    try appleEventStore.save(event, span: .thisEvent)
                    //print("events added with dates:")
                } catch let e as NSError {
                    print(e.description)
                    return
                }
                /*
                let WeStartDateF1 = dateformatter.date(from: "2017-05-10T"+WeStartHour24H)
                event.startDate =  WeStartDateF1! as Date
                let WeendDateF1 = dateformatter.date(from: "2017-05-10T"+WeEndHour24H)
                event.endDate =  WeendDateF1! as Date
                event.notes = "KU Calendar"
                event.calendar = appleEventStore.defaultCalendarForNewEvents
                do {
                    try appleEventStore.save(event, span: .thisEvent)
                    //print("events added with dates:")
                } catch let e as NSError {
                    print(e.description)
                    return
                }*/
            }
            ///////////////////////////
            if Thursday=="1" {
                let event:EKEvent = EKEvent(eventStore: appleEventStore)
                event.title = Name
                let ThStartHour24H = amAppend(str: StartHour)
                let ThEndHour24H = amAppend(str: EndHour)
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                
                let ThStartDateF = dateformatter.date(from: "2017-05-04T"+ThStartHour24H)///
                event.startDate =  ThStartDateF! as Date
                let ThendDateF = dateformatter.date(from: "2017-05-04T"+ThEndHour24H)
                event.endDate =  ThendDateF! as Date
                event.notes = "KU Calendar"
                event.calendar = appleEventStore.defaultCalendarForNewEvents
                do {
                    try appleEventStore.save(event, span: .thisEvent)
                    //print("events added with dates:")
                } catch let e as NSError {
                //    print(e.description)
                    return
                }
                /*
                let ThStartDateF1 = dateformatter.date(from: "2017-05-11T"+ThStartHour24H)
                event.startDate =  ThStartDateF1! as Date
                let ThendDateF1 = dateformatter.date(from: "2017-05-11T"+ThEndHour24H)
                event.endDate =  ThendDateF1! as Date
                event.notes = "KU Calendar"
                event.calendar = appleEventStore.defaultCalendarForNewEvents
                do {
                    try appleEventStore.save(event, span: .thisEvent)
                    //print("events added with dates:")
                } catch let e as NSError {
                    print(e.description)
                    return
                }*/
            }
            ///////////////////////////
            if Friday=="1" {
                let event:EKEvent = EKEvent(eventStore: appleEventStore)
                event.title = Name
                let FrStartHour24H = amAppend(str: StartHour)
                let FrEndHour24H = amAppend(str: EndHour)
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                
                let FrStartDateF = dateformatter.date(from: "2017-05-05T"+FrStartHour24H)///
                event.startDate =  FrStartDateF! as Date
                let FrendDateF = dateformatter.date(from: "2017-05-05T"+FrEndHour24H)
                event.endDate =  FrendDateF! as Date
                event.notes = "KU Calendar"
                event.calendar = appleEventStore.defaultCalendarForNewEvents
                do {
                    try appleEventStore.save(event, span: .thisEvent)
                    //print("events added with dates:")
                } catch let e as NSError {
                    print(e.description)
                    return
                }
                /*
                let FrStartDateF1 = dateformatter.date(from: "2017-05-12T"+FrStartHour24H)
                event.startDate =  FrStartDateF1! as Date
                let FrendDateF1 = dateformatter.date(from: "2017-05-12T"+FrEndHour24H)
                event.endDate =  FrendDateF1! as Date
                event.notes = "KU Calendar"
                event.calendar = appleEventStore.defaultCalendarForNewEvents
                do {
                    try appleEventStore.save(event, span: .thisEvent)
                    //print("events added with dates:")
                } catch let e as NSError {
                    print(e.description)
                    return
                }*/
            }
            ///////////////////////////
            
            
            

        
        }
        
        
        if Type=="0" {
            
            
        }
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
    
    //////
    func addAssignmentEvents(Name: String, Month: String,Day: String, Time: String)
    {
       print(Name+" "+Month+" "+Day+" "+Time)
        let event:EKEvent = EKEvent(eventStore: appleEventStore)
        event.title = Name
        let ThStartHour24H = amAppend(str: Time)
        //let ThEndHour24H = amAppend(str: EndHour)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let ThStartDateF = dateformatter.date(from: "2017-"+Month+"-"+Day+"T"+ThStartHour24H)///
        event.startDate =  ThStartDateF! as Date
      
        event.endDate =  ThStartDateF! as Date
        event.notes = "KU Calendar"
        event.calendar = appleEventStore.defaultCalendarForNewEvents
        do {
            try appleEventStore.save(event, span: .thisEvent)
            //print("events added with dates:")
        } catch let e as NSError {
            //    print(e.description)
            return
        }
        
    }
    ///////
    
    
}
