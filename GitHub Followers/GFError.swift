//
//  ErrorMessage.swift
//  GitHub Followers
//
//  Created by Muhammad Fakhrulghazi bin Mohd Fouad on 09/12/2020.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "The data received from the server was invalid. Please try again"
    case unableToFavourite = "There was an error favouriting this user. Please try again"
    case alreadyInFavourites = "You've already favourited this use. You must really like them"
}
