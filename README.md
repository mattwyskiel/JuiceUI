# JuiceUI

A small collection of what I thought would be useful SwiftUI wrappers for common views in the iOS SDK. The goal is to fill in the gap a bit between what Apple integrated into SwiftUI and the components iOS developers actually use.

This was also an excuse for me to play around with SwiftUI and release my first Swift Package, so there's that.

## Installation

Simply go into your Xcode project, go to **File > Swift Packages > Add Package Dependency** and provide the URL to this repository (`https://github.com/mattwyskiel/JuiceUI.git`) and have it pull from **master**.

## Components

### Sign In With Apple button

![Sign In With Apple button](./Demo/SignInWithApple.png)

Relevant code:

```swift
AppleIDAuthButton(requestedScopes: [.fullName, .email])
    .onSuccess({ /* success handler */ })
    .frame(height: 55)
```

### Share Sheet

![Share Sheet](./Demo/ShareSheet.gif)

Relevant code:

```swift
.sheet(isPresented: $showShareSheet) {
    ShareSheet(items: [URL(string: self.url)!])
    .onComplete { (activityType, completed, returnedItems, activityError) in
        /* completion handler */
    }
}
```

### Font Picker

![Font Picker](./Demo/FontPicker.gif)

Relevant code:

```swift
.sheet(isPresented: $showPicker) {
    NavigationView {
        FontPicker(didPickFont: { font in
            self.fontName = font.postscriptName // self.fontName is @State, so the text font updates automatically
        })
    }
}
```

### Image Picker

![Image Picker](./Demo/ImagePicker.gif)

Relevant code:

```swift
.sheet(isPresented: $showPicker) {
    ImagePicker(sourceType: .photoLibrary) { info in
        self.imageURL = info[.imageURL] as? URL // updates the image automatically
    }
    .onCancel {
        self.imageURL = nil
    }
}
```

### Page View

![Page View](./Demo/PageView.gif)

Relevant code:

```swift
ZStack{
    Color.veryLightGray.edgesIgnoringSafeArea(.all) // so you can see the page indicator; also, veryLightGray is a custom color.
    PageView {
        Page {
            ZStack {
                Color.blue
                Text("Hello")
            }
        }
        Page {
            ZStack {
                Color.red
                Text("World")
            }
        }
        Page {
            Text("This Works!!!")
        }
    }
}
```

### Mail Composer

(no preview because this doesn't work in the simulator, and I've deleted the mail app on all my devices :grimacing:)

```swift
.sheet(isPresented: $isPresenting) {
    MailComposeView()
    .message(self.message)
    .didCancel {
        self.text = "cancelled"
    }
    .didSend {
        self.text = "sent"
    }
    .didFail { error in
        self.text = "Error: " + error.localizedDescription
    }
    .didSaveDraft {
        self.text = "saved draft"
    }
}
```

## Demo

Want to see all of this in more detail? See the `JuiceUI Previews.xcodeproj` in the `Demo` folder.

## License

This software is published under the MIT License. See `LICENSE` for more details
