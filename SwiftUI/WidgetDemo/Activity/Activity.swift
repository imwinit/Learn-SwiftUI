//
//  Activity.swift
//  Activity
//
//  Created by Vineet Kumar on 22/10/20.
//

import WidgetKit
import SwiftUI

let widgetActivityDeeplinkURL = "widget-activity-deeplink://"

struct Provider: TimelineProvider {
    
    /// Represent widget while it loads the first time is added to the homescreen
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), activity: ActivityModel.placeholder())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), activity: ActivityModel.placeholder())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
    
        fetchActivities { activity, error in
            completion(getTimeLineFromActivity(activity: activity, with: context))
        }
    }
    
    // Your api code
    private func fetchActivities(completion: @escaping (ActivityModel, Bool) -> Void) {
        completion(ActivityModel.random(), true)
    }
    
    // Create a timeline from new data
    private func getTimeLineFromActivity(activity: ActivityModel, with context: Context) -> Timeline<Entry> {
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        entries.append(SimpleEntry(date: Calendar.current.date(byAdding: .second, value: 5, to: currentDate)!, activity: activity))
        
        /// Found Minimum refresh duration to be 5 minutes
        print("Widget Refresh at: \(currentDate.description(with: .current))")
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        // Policy .atEnd to refresh after the last date in timeline passes
        // Use WidgetCenter.shared.reloadAllTimelines() to manually relaod the widget eg. a bkg api refresh from app (only if app is in bkg not terminated)
        return timeline
      }
}

/// Your custom Timeline entry object
/// Timeline entries identify the date you want WidgetKit to update the widget’s content.
struct SimpleEntry: TimelineEntry {
    let date: Date
    var activity: ActivityModel // Your model from the app with target membership selected for widget extension
}

/// Your custom View to display content for Widget
struct ActivityEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        
        let urlStr = widgetActivityDeeplinkURL + "\(entry.activity.img.encode())".addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
        
        Text(entry.activity.img)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .font(.system(size: 100))
            .background(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
            .widgetURL(URL(string: urlStr))
        
        // Can use Link only for medium & large widgets for small have to use widgetURL
    }
}

// Activity Widget
struct Activity: Widget {
    let kind: String = "Activity"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ActivityEntryView(entry: entry)
        }
        .configurationDisplayName("Activity Widget")
        .description("This is an activity widget description")
        .supportedFamilies([.systemSmall,.systemMedium,.systemLarge])
        // The set of sizes the widget supports by default - all
    }
}

struct Activity_Previews: PreviewProvider {
    static var previews: some View {
        ActivityEntryView(entry: SimpleEntry(date: Date(), activity: ActivityModel.placeholder()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

/// This main represents entry point for your widget(s)
@main
struct MainWidgets: WidgetBundle { // WidgetBundle to use multiple widgets
    
    @WidgetBundleBuilder
    var body: some Widget {
        Activity()
        Texter()
    }
}
