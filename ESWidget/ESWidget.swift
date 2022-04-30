//
//  ESWidget.swift
//  ESWidget
//
//  Created by Noah Boyers on 1/23/22.
//

import WidgetKit
import SwiftUI
import Intents

// MARK: Reference for Widgets https://www.youtube.com/watch?v=jmcxr0NMkUo&t=1382s

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(),squidName: "", configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(),squidName: "", configuration: configuration)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        let userDefault = UserDefaults(suiteName: "group.ESWidget")
        let squidData = userDefault?.value(forKey: "squidName") as? String ?? ""
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(
                date: entryDate,
                squidName: squidData,
                configuration: configuration)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let squidName: String
    let configuration: ConfigurationIntent
}

// The way the widget looks when
struct ESWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        GeometryReader { geo in
            Image("\(entry.squidName)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
        }
    }
}

@main
struct ESWidget: Widget {
    let kind: String = "ESWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            ESWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct ESWidget_Previews: PreviewProvider {
    static var previews: some View {
        ESWidgetEntryView(entry: SimpleEntry(date: Date(),squidName: "HappySquid", configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
