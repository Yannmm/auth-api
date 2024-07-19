# frozen_string_literal: true

module Api
  module V1
    class CompaniesController < ApiController
      before_action :set_company, only: %i[show update destroy]

      respond_to :json

      def index
        @companies = current_user.companies
      end

      def create
        @company = current_user.companies.new(company_params)
        if @company.save
          render json: @company, status: :created
        else
          render json: {
            status: { message: 'Company could not be created.', errors: @company.errors.full_messages }
          }, status: 422
        end
      end

      def show
        render json: @company, status: :ok
      end

      def update
        if @company.update(company_params)
          render json: @company, status: :ok
        else
          render json: {
            status: { message: 'Company could not be updated.', errors: @company.errors.full_messages }
          }, status: :unprocessable_entity
        end
      end

      def destroy
        if @company.destroy
          render json: {
            status: 'Company has been destroyed successfully.'
          }, status: :ok
        else
          render json: {
            status: { message: 'Company cannot be destroyed', errors: @company.errors.full_messages }
          }
        end
      end

      private

      # TODO: ?
      def set_company
        @company = current_user.companies.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render json: e.message, status: :not_found
      end

      def company_params
        params.require(:company).permit(:name, :established_year, :address)
      end
    end
  end
end
