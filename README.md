# Ami
<img src="Ami/Extra/Assets.xcassets/amiLogoBlackAlpha.imageset/output-onlinepngtools.png" width="200" height="200">

Ami is a TJ Bot robot that, with the implemetation of some IBM's API, develop conversations with a child.
Then, with a tenuous vocabulary, it creates a _bond_ with the child.
####
Our iOS application retrieves data from the conversations, which are stored in a database, and shows the analysis of the perceived emotions and key-words the child said.

## Notes:
Made in **Swift 5** for  target iOS version **10.3** or greater
####
We are using CocoaPods to gather the [Charts](https://github.com/danielgindi/Charts) module
###
Install CocoaPods:

Use your terminal to install CocoaPods

```bash
$ sudo gem cocoapods
```

Go to your project directory

```bash
$ cd Ami
```

And create a Podfile

```bash
$ pod init
```

Then edit this to your Podfile 

```ruby
  #add this under
  #use_frameworks!
  
  # Pods for Ami
  pod 'Charts'
```

Back in terminal, run

```bash
pod install
```

For now and on, open your project in Ami.xcworkspace

If you want to add the Charts Module, in your Swift file add

```swift
  import Charts
```

## Images

<ul li display=inline>
  <li >
    <img src="Ami/Ami_Images/loginAmi" width="200" height="356">
  </li>
  <li>
    <img src="Ami/Ami_Images/graphEmotions" width="200" height="356">
  </li>
  <li>
    <img src="Ami/Ami_Images/graphWords" width="200" height="356">
  </li>
</ul>  
