//
//  PersistenceManager.swift
//  GitHub Followers
//
//  Created by Muhammad Fakhrulghazi bin Mohd Fouad on 15/12/2020.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    static private let defaults = UserDefaults.standard
    //saving a custom object which is our array of followers to userdefaults because user defaults saves it as data
    
    enum Keys {
        static let favourites = "favourites"
    }
    
    static func updateWith(favourite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError?) -> Void) {
        
        retrieveFavourites { (result) in
            switch result {
            case .success(let favourites):
                var retrievedFavourites = favourites
                
                switch actionType {
                case .add:
                    guard !retrievedFavourites.contains(favourite) else {
                        completed(.alreadyInFavourites)
                        return
                    }
                    retrievedFavourites.append(favourite)
                    break

                case .remove:
                    retrievedFavourites.removeAll { $0.login == favourite.login
                    }
                }
                
                completed(save(favourites: retrievedFavourites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavourites(completed: @escaping (Result<[Follower],GFError>) -> Void){
        guard let favouriteData = defaults.object(forKey: Keys.favourites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favourites = try decoder.decode([Follower].self, from: favouriteData)
            completed(.success(favourites))
        } catch {
            completed(.failure(.unableToComplete))
        }
    }
    
    static func save(favourites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavourites = try encoder.encode(favourites)
            defaults.setValue(encodedFavourites, forKey: Keys.favourites)
            return nil
        } catch {
            return .unableToFavourite
        }
    }
}
