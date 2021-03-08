//
//  Font.swift
//  iOS movie app
//
//  Created by Facundo Bogado on 06/03/2021.
//

import UIKit

public enum Font {
    public enum Futura {
        static func medium(size: CGFloat) -> UIFont {
            return UIFont(name: "Futura-Medium", size: size)!
        }

        static func bold(size: CGFloat) -> UIFont {
            return UIFont(name: "Futura-Bold", size: size)!
        }
    }

    public enum Avenir {
        static func heavy(size: CGFloat) -> UIFont {
            return UIFont(name: "Avenir-Heavy", size: size)!
        }

        static func medium(size: CGFloat) -> UIFont {
            return UIFont(name: "Avenir-Medium", size: size)!
        }

        static func black(size: CGFloat) -> UIFont {
            return UIFont(name: "Avenir-Black", size: size)!
        }
    }
}
