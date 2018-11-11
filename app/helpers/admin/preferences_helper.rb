module Admin::PreferencesHelper

    def sort_orders
        [OpenStruct.new(val: "ASC"), OpenStruct.new(val: "DESC")]
    end

    def booleans
        [OpenStruct.new(val: true), OpenStruct.new(val: false)]
    end
end
