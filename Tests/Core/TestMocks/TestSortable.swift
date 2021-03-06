//
//  TestSortable.swift
//  Tests
//
//  Created by Mederic Petit on 23/2/18.
//  Copyright © 2017-2018 Omise Go Pte. Ltd. All rights reserved.
//

import OmiseGO

struct TestPaginatedListable: PaginatedListable {
    let aSortableAttribute: String
    let aNonSortableAttribute: String

    let aSearchableAttribute: String
    let aNonSearchableAttribute: String

    enum SortableFields: String, RawEnumerable {
        case aSortableAttribute = "a_sortable_attribute"
    }

    enum FilterableFields: String, RawEnumerable {
        case aFilterableAttribute = "a_searchable_attribute"
    }
}
