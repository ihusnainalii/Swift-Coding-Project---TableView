//
//  PreviewDataSource.swift
//  ProgrammaticView
//
//  Created by Husnain Ali on 13/06/2022.
//

import Foundation

class PreviewDataSource {
    
    // Data Source
    private var names = (1...50).map { Preview("\($0 ?? 0)", $0) }
    
    // Counter
    var numberOfData: Int {
        names.count
    }
    
    public func loadPreview(at index:Int) -> PreviewOperation? {
        if (0...names.count - 1).contains(index) {
             return PreviewOperation(names[index])
        }
        return .none
    }
}
class PreviewOperation : Operation {
    
    var nameData: String?
    var loadingCompletionHandle: ((String?) -> ())?
    
    private var preview: Preview
    
    init(_ preview: Preview) {
        self.preview = preview
    }
    
    override func main() {
        if isCancelled{ return }
        guard let index = preview.index else { return }
        
        MainRepository().fetchName(at: index) { success, message, model in
            if success {
                if let indexName = model {
                    DispatchQueue.main.async { [weak self] in
                        guard let `self` = self else { return }
                        if self.isCancelled { return }
                           self.nameData = indexName
                           self.loadingCompletionHandle?(indexName)
                    }
                }
            }
        }
    }
}
