//
//  Texter.swift
//  WidgetDemo
//
//  Created by Vineet Kumar on 23/10/20.
//

import WidgetKit
import SwiftUI

// Texter Widget
struct Texter: Widget {
    let kind: String = "Texter"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: TexterProvider()) { entry in
            TexterEntryView(entry: entry)
        }
        .configurationDisplayName("Texter Widget")
        .description("This is an texter widget description")
    }
}

struct TexterEntryView: View {
    var entry: TexterProvider.Entry
    
    var body: some View {
        
        Text(getFormattedDate())
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.black)
            .font(.custom("Marker Felt", size: 16))
            .background(Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
    }
    
    private func getFormattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: entry.date)
    }
}

struct TexterProvider: TimelineProvider {
    
    func placeholder(in context: Context) -> TexterEntry {
        TexterEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (TexterEntry) -> ()) {
        let entry = TexterEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<TexterEntry>) -> ()) {
    
        var entries: [TexterEntry] = []
        let currentDate = Date()
        entries.append(TexterEntry(date: Calendar.current.date(byAdding: .second, value: 5, to: currentDate)!))
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct TexterEntry: TimelineEntry {
    let date: Date
}
