//
//  AddButtonShape.swift
//  P0modoro
//

import SwiftUI

struct AddButtonShape: Shape {
    func path(in rect: CGRect) -> Path {
        let svgWidth: CGFloat = 149
        let svgHeight: CGFloat = 133
        let sx = rect.width / svgWidth
        let sy = rect.height / svgHeight

        var path = Path()

        // Outer blob outline
        path.move(to: CGPoint(x: 98.4842 * sx, y: 10.085 * sy))
        path.addCurve(
            to: CGPoint(x: 25.2587 * sx, y: 14.139 * sy),
            control1: CGPoint(x: 76.6104 * sx, y: 10.2043 * sy),
            control2: CGPoint(x: 30.3165 * sx, y: 11.508 * sy)
        )
        path.addCurve(
            to: CGPoint(x: 1.01903 * sx, y: 84.7363 * sy),
            control1: CGPoint(x: 10.6364 * sx, y: 21.7453 * sy),
            control2: CGPoint(x: 2.85853 * sx, y: 53.3696 * sy)
        )
        path.addCurve(
            to: CGPoint(x: 68.7854 * sx, y: 127.647 * sy),
            control1: CGPoint(x: 0.223939 * sx, y: 98.2939 * sy),
            control2: CGPoint(x: 24.4458 * sx, y: 109.093 * sy)
        )
        path.addCurve(
            to: CGPoint(x: 116.62 * sx, y: 120.918 * sy),
            control1: CGPoint(x: 88.6769 * sx, y: 135.97 * sy),
            control2: CGPoint(x: 105.558 * sx, y: 128.344 * sy)
        )
        path.addCurve(
            to: CGPoint(x: 147.708 * sx, y: 56.5092 * sy),
            control1: CGPoint(x: 142.947 * sx, y: 103.245 * sy),
            control2: CGPoint(x: 146.222 * sx, y: 80.8049 * sy)
        )
        path.addCurve(
            to: CGPoint(x: 143.245 * sx, y: 36.6753 * sy),
            control1: CGPoint(x: 148.269 * sx, y: 47.3395 * sy),
            control2: CGPoint(x: 145.831 * sx, y: 41.3839 * sy)
        )
        path.addCurve(
            to: CGPoint(x: 108.024 * sx, y: 12.8292 * sy),
            control1: CGPoint(x: 137.428 * sx, y: 26.0852 * sy),
            control2: CGPoint(x: 122.026 * sx, y: 21.628 * sy)
        )
        path.addCurve(
            to: CGPoint(x: 85.6908 * sx, y: 3.76329 * sy),
            control1: CGPoint(x: 99.165 * sx, y: 7.80735 * sy),
            control2: CGPoint(x: 91.5548 * sx, y: 4.77342 * sy)
        )
        path.addCurve(
            to: CGPoint(x: 73.0088 * sx, y: 1.00024 * sy),
            control1: CGPoint(x: 82.6157 * sx, y: 3.21082 * sy),
            control2: CGPoint(x: 79.3392 * sx, y: 2.57741 * sy)
        )

        // Close back to start
        path.addLine(to: CGPoint(x: 98.4842 * sx, y: 10.085 * sy))

        // Plus vertical stroke
        path.move(to: CGPoint(x: 80.9881 * sx, y: 37.8717 * sy))
        path.addLine(to: CGPoint(x: 80.9881 * sx, y: 96.5908 * sy))

        // Plus horizontal stroke
        path.move(to: CGPoint(x: 46.2371 * sx, y: 68.0302 * sy))
        path.addCurve(
            to: CGPoint(x: 93.0147 * sx, y: 73.6684 * sy),
            control1: CGPoint(x: 55.2203 * sx, y: 68.0302 * sy),
            control2: CGPoint(x: 80.7019 * sx, y: 69.9868 * sy)
        )
        path.addCurve(
            to: CGPoint(x: 100.965 * sx, y: 75.5735 * sy),
            control1: CGPoint(x: 95.7251 * sx, y: 74.4982 * sy),
            control2: CGPoint(x: 98.2621 * sx, y: 75.2079 * sy)
        )
        path.addCurve(
            to: CGPoint(x: 109.338 * sx, y: 75.9391 * sy),
            control1: CGPoint(x: 103.668 * sx, y: 75.9391 * sy),
            control2: CGPoint(x: 106.461 * sx, y: 75.9391 * sy)
        )

        return path
    }
}

#Preview {
    AddButtonShape()
        .stroke(Color.black, lineWidth: 2)
        .frame(width: 40, height: 36)
        .padding()
}
