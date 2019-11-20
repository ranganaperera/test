//
//  DummyViewController.swift
//  Expense Tracker
//
//  Created by iTelaSoft-PC on 11/20/19.
//  Copyright © 2019 Danutha Fernando. All rights reserved.
//

import UIKit

class DummyViewController: UIViewController {
    
    let words = ["start", "citizen", "flour", "circle", "petty", "neck", "seem", "lake", "page", "color", "ceiling", "angle", "agent", "mild", "touch", "bite", "cause", "finance", "greet", "eat", "minor", "echo", "aviation", "baby", "role", "surround", "incapable", "refuse", "reliable", "imperial", "outer", "liability", "struggle", "harsh", "coerce", "front", "strike", "rage", "casualty", "artist", "ex", "transaction", "parking", "plug", "formulate", "press", "kettle", "export", "hiccup", "stem", "exception", "report", "central", "cancer", "volunteer", "professional", "teacher", "relax", "trip", "fountain", "effect", "news", "mark", "romantic", "policy", "contemporary", "conglomerate", "cotton", "happen", "contempt", "joystick", "champagne", "vegetation", "bat", "cylinder", "classify", "even", "surgeon", "slip", "private", "fox", "gravity", "aspect", "hypnothize", "generate", "miserable", "breakin", "love", "chest", "split", "coach", "pound", "sharp", "battery", "cheap", "corpse", "hobby", "mature", "attractive", "rock"]
    
    static var count = 0
    var dictionary =  [Int:String]()
    var iswriteTofileSystem = false
    var isentToServer : Bool = false
    
    enum ErrorsToThrow: Error {
    case fileNotFound (String)
    case fileNotReadable (String)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

              //TASK: 1
              for element in 1...100 {
                  print("number: \(element) word:\(getRandomWordSync())")
              }
              
              
               //TASK: 2
             for number in 1...100 {
      
              if (!(number%3==0) && !(number%5 == 0)){
                  print("number: \(number)  and the word is:\(getRandomWordSync())")
      
              }
              else if (number%3==0 && number%5==0){
                  print("number: \(number)  and the word is:FizzBuzz")
              }
              else if number%3==0{
                   print("number: \(number)  and the word is:Fizz")
              }
              else if number%5 == 0 {
                  print("number: \(number)  and the word is:Buzz")
              }else {
                  print("No Result")
              }
      
             }
             
              
                //TASK: 3.1
              for _ in 1...100 {
                getRandomWord(completion: asyncRepeatStep1(word:error:))
              }
              
                //TASK: 3.2
                for _ in 1...100 {
                  getRandomWord(completion: asyncRepeatStep2(word:error:))
                }

              
        
              
                  // TASK: 4.1
      
                  for _ in 1...100 {
                      do {
                                try? throwErrorinher()
                         throw ErrorsToThrow.fileNotFound ("It shouldn't break anything!")
      
                      } catch {
                              print(error)
                      }
      
                  }
              
            // TASK: 4.2
    
                          for _ in 1...100 {
                              do {
                                  try throwErrorWithMessage()
      
                              } catch {
                                      print(error)
                              }
      
                          }
              
              
              // TASK: 5.1
                  for _ in 1...100 {
                       iswriteTofileSystem = true
                        getRandomWord(completion: asyncRepeatStep1(word:error:))
                  }
                              
          
            //TASK: 5.2
                 for _ in 1...100 {
                  iswriteTofileSystem = true
                  getRandomWord(completion: asyncRepeatStep2(word:error:))
                 }
              
              
            //TASK: 6
                  for _ in 1...100 {
                      isentToServer = true
                      getRandomWord(completion: asyncRepeatStep1(word:error:))
                  }
    }
    func throwErrorinher() throws {
       
        getRandomWord { (word, error) in
           
        }
        
    }
    func throwErrorWithMessage() throws {
        DummyViewController.count += 1
        var random_word : String?
       
        getRandomWord { (word, error) in
            random_word = word == nil ? error : word
        }
        
                           if (!(DummyViewController.count%3==0) && !(DummyViewController.count%5 == 0)){
                               print("number: \(DummyViewController.count)  and the word is:\(random_word ?? "nil")")
                           }
                           else if (DummyViewController.count%3==0 && DummyViewController.count%5==0){
                                throw ErrorsToThrow.fileNotFound ("It shouldn't break anything!!!!")
                           }
                           else if DummyViewController.count%3==0{
                               throw ErrorsToThrow.fileNotFound ("It shouldn't break anything!!!!")
                           }
                           else if DummyViewController.count%5 == 0 {
                               throw ErrorsToThrow.fileNotFound ("It shouldn't break anything!!!!")
                           }else {
                               print("No Result")
                           }
        
    }
    func asyncRepeatStep1(word:String?, error:String?) {
        DummyViewController.count += 1
        let random_word = word == nil ? error : word
        dictionary.updateValue(random_word!, forKey:DummyViewController.count)
        
        if iswriteTofileSystem  {
             writeToFileSystem(wordToBeWritten: random_word!, id: DummyViewController.count)
        }else{
             print("number:\(DummyViewController.count) word : \(random_word!)")
        }
        
        if (dictionary.count == 100 && isentToServer){
             print("send to server")
             sendToServer(parameters: dictionary)
        }
    }
    
    func asyncRepeatStep2(word:String?, error:String?) {
        DummyViewController.count += 1
        let random_word = word == nil ? error : word
        dictionary.updateValue(random_word!, forKey:DummyViewController.count)
        
        if iswriteTofileSystem {
            if (!(DummyViewController.count%3==0) && !(DummyViewController.count%5 == 0)){
                writeToFileSystem(wordToBeWritten: random_word!, id: DummyViewController.count)
            }
            else if (DummyViewController.count%3==0 && DummyViewController.count%5==0){
                writeToFileSystem(wordToBeWritten: random_word!, id: DummyViewController.count)
            }
            else if DummyViewController.count%3==0{
                writeToFileSystem(wordToBeWritten: random_word!, id: DummyViewController.count)
            }
            else if DummyViewController.count%5 == 0 {
                writeToFileSystem(wordToBeWritten: random_word!, id: DummyViewController.count)
            }else {
                writeToFileSystem(wordToBeWritten: random_word!, id: DummyViewController.count)
            }
        }else{
            
                    if (!(DummyViewController.count%3==0) && !(DummyViewController.count%5 == 0)){
                        print("number: \(DummyViewController.count)  and the word is:\(random_word!)")
                    }
                    else if (DummyViewController.count%3==0 && DummyViewController.count%5==0){
                        print("number: \(DummyViewController.count)  and the word is:FizzBuzz")
                    }
                    else if DummyViewController.count%3==0{
                         print("number: \(DummyViewController.count)  and the word is:Fizz")
                    }
                    else if DummyViewController.count%5 == 0 {
                        print("number: \(DummyViewController.count)  and the word is:Buzz")
                    }else {
                        print("No Result")
                    }
        }
        
        if (dictionary.count == 100 && isentToServer){
            print("send to server")
            sendToServer(parameters: dictionary)
        }
        
    }
    
    func writeToFileSystem(wordToBeWritten:String,id:Int) {
        let str = wordToBeWritten
        let FILE_ID = String(describing: id)
        // get URL to the the documents directory in the sandbox
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as NSURL

        // add a filename
        let fileUrl = documentsUrl.appendingPathComponent(FILE_ID)

        // write to it
        try! str.write(to: fileUrl!, atomically: true, encoding: String.Encoding.utf8)
        
    }
    
    func sendToServer(parameters:[Int:String]) {
        //create the url with URL
        let url = URL(string: "www.thisismylink.com/postName.php")! //change the url

        //create the session object
        let session = URLSession.shared

        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }

        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

            guard error == nil else {
                return
            }

            guard let data = data else {
                return
            }

            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    // handle json...
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    func getRandomWordSync() -> String {
           let index = randomInRange(min: 0, max: 100)
           let word = words[index]
           return word
       }

       func getRandomWord(slow: Bool = false, completion:@escaping(_ word: String?, _ error: String?)->()) {
           let index = randomInRange(min: 0, max: 200)
           guard let word = words[safe: index] else {
             return completion(nil, "Fatal error: Index out of range")
           }
           
           let delay = slow ? 500.0 : 0.0
           
           DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
               completion(word, nil)
           }
       }

       func randomInRange(min: Int, max: Int) -> Int {
           return Int.random(in: min ..< max)
       }
       
}
extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
