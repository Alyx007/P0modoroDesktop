//
//  SVGPathShape.swift
//  P0modoro
//

import SwiftUI

struct SVGPathShape: Shape {
    let svgPath: String
    let svgSize: CGSize

    func path(in rect: CGRect) -> Path {
        let sx = rect.width / svgSize.width
        let sy = rect.height / svgSize.height

        var path = Path()
        let tokens = tokenize(svgPath)
        var i = 0
        var currentPoint = CGPoint.zero

        while i < tokens.count {
            let token = tokens[i]
            switch token {
            case "M":
                let x = Double(tokens[i+1])! * sx
                let y = Double(tokens[i+2])! * sy
                path.move(to: CGPoint(x: x, y: y))
                currentPoint = CGPoint(x: x, y: y)
                i += 3
                // Implicit lineTo after M
                while i < tokens.count, Double(tokens[i]) != nil {
                    let lx = Double(tokens[i])! * sx
                    let ly = Double(tokens[i+1])! * sy
                    path.addLine(to: CGPoint(x: lx, y: ly))
                    currentPoint = CGPoint(x: lx, y: ly)
                    i += 2
                }
            case "C":
                i += 1
                while i + 5 < tokens.count, Double(tokens[i]) != nil {
                    let c1x = Double(tokens[i])! * sx
                    let c1y = Double(tokens[i+1])! * sy
                    let c2x = Double(tokens[i+2])! * sx
                    let c2y = Double(tokens[i+3])! * sy
                    let ex = Double(tokens[i+4])! * sx
                    let ey = Double(tokens[i+5])! * sy
                    path.addCurve(
                        to: CGPoint(x: ex, y: ey),
                        control1: CGPoint(x: c1x, y: c1y),
                        control2: CGPoint(x: c2x, y: c2y)
                    )
                    currentPoint = CGPoint(x: ex, y: ey)
                    i += 6
                }
            case "L":
                i += 1
                while i + 1 < tokens.count, Double(tokens[i]) != nil {
                    let lx = Double(tokens[i])! * sx
                    let ly = Double(tokens[i+1])! * sy
                    path.addLine(to: CGPoint(x: lx, y: ly))
                    currentPoint = CGPoint(x: lx, y: ly)
                    i += 2
                }
            case "H":
                let hx = Double(tokens[i+1])! * sx
                path.addLine(to: CGPoint(x: hx, y: currentPoint.y))
                currentPoint = CGPoint(x: hx, y: currentPoint.y)
                i += 2
            case "V":
                let vy = Double(tokens[i+1])! * sy
                path.addLine(to: CGPoint(x: currentPoint.x, y: vy))
                currentPoint = CGPoint(x: currentPoint.x, y: vy)
                i += 2
            case "Z", "z":
                path.closeSubpath()
                i += 1
            default:
                i += 1
            }
        }
        return path
    }

    private func tokenize(_ d: String) -> [String] {
        var result: [String] = []
        var current = ""
        let commands: Set<Character> = ["M","m","C","c","L","l","H","h","V","v","Z","z","S","s","Q","q"]

        for ch in d {
            if commands.contains(ch) {
                if !current.trimmingCharacters(in: .whitespaces).isEmpty {
                    result.append(contentsOf: splitNumbers(current))
                }
                result.append(String(ch))
                current = ""
            } else if ch == "," || ch == " " || ch == "\n" {
                if !current.trimmingCharacters(in: .whitespaces).isEmpty {
                    result.append(contentsOf: splitNumbers(current))
                }
                current = ""
            } else {
                current.append(ch)
            }
        }
        if !current.trimmingCharacters(in: .whitespaces).isEmpty {
            result.append(contentsOf: splitNumbers(current))
        }
        return result
    }

    // Splits strings like "288.081C425.424" that might not have a space before a negative sign
    private func splitNumbers(_ s: String) -> [String] {
        var results: [String] = []
        var current = ""
        for (i, ch) in s.enumerated() {
            if ch == "-" && i > 0 && !current.isEmpty {
                results.append(current)
                current = String(ch)
            } else {
                current.append(ch)
            }
        }
        if !current.isEmpty {
            results.append(current)
        }
        return results
    }
}
