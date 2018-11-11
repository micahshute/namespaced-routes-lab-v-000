class Admin::PreferencesController < ApplicationController

    def index
        @preference = Admin::Preference.first_or_create(artist_sort_order: "ASC", song_sort_order: "ASC", allow_create_artists: true, allow_create_songs: true)
    end 

    def update
        preference = Admin::Preference.first_or_create
        preference.update(preference_params(:artist_sort_order, :song_sort_order, :allow_create_artists, :allow_create_songs))
        flash[:notice] = "Preferences Successfully Updated"
        redirect_to admin_preferences_path
    end


    private

    def preference_params(*args)
        params.require(:admin_preference).permit(*args)
    end
end
