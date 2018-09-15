class EntriesController < InheritedResources::Base

  private

    def entry_params
      params.require(:entry).permit(:user_id, :recruitment_id)
    end
end

