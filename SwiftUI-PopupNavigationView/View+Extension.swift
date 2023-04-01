//
//  View+Extension.swift
//  SwiftUI-PopupNavigationView
//
//  Created by Ikmal Azman on 01/04/2023.
//

import SwiftUI

extension View {
    /// Allow to display popup overlay when @Bindable boolean is true
    /// - Parameters:
    ///   - show: Indicate the popup should show or dismiss
    ///   - horizontalPadding:Apply padding in horizontal of the View
    ///   - verticalPadding: Apply padding in vertical of the View
    ///   - cornerRadius: Apply corner radius for the Popup Overlay
    ///   - content: Accept View as content, that allow it to display in the Popup Overlay
    func popupNavigationView<Content:View>(
        show: Binding<Bool>,
        horizontalPadding : CGFloat = 40,
        verticalPadding : CGFloat = 40,
        cornerRadius : CGFloat = 15,
        @ViewBuilder content : @escaping () -> Content) -> some View {
            return self
            /// Allow the popup to display and fit through all available space, also it will avoid popup won't be display due not have the appropriate size
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment : .center)
                .overlay {
                    if show.wrappedValue {
                        /// `GeometryReader`: A container view that define its own content as function which it has own size & coordinate space
                        /// `proxy`: object with `GeometryProxy` type, allow to access preferred container size/frame  based on its parent layout.
                        GeometryReader { proxy in
                            
                            let size = proxy.size
                            
                            /// Add black layer behind popup
                            Color.black.opacity(0.10).ignoresSafeArea()
                            
                            NavigationView {
                                /// Allow to display custom Container View
                                content()
                            }
                            /// Specify the fixed size for the container view
                            .frame(width: size.width - horizontalPadding, height: size.height - (verticalPadding * 2), alignment : .center)
                            .cornerRadius(cornerRadius)
                            /// Specify the container view need to adapt its size with parent view
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment : .center)
                        }
                    }
                }
        }
}
