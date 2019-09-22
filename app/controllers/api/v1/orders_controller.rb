module Api
  module V1
    class OrdersController < ApplicationController
      def index
        orders = Order.order('created_at DESC');
        render json: {status: 'SUCCESS', message: 'Orders loaded', data: orders}, status: :ok
      end

      def show
        order = Order.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded order', data: order}, status: :ok
      end

      def create
        order = Order.new(orders_params)
        if order.save
          render json: {status: 'SUCCESS', message: 'Saved order', data: order}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Order not saved', data: order.erros}, status: :unprocessable_entity
        end
      end

      def update
        order = Order.find(params[:id])
        if article.update_attributes(order_params)
					render json: {status: 'SUCCESS', message:'Updated order', data: order}, status: :ok
				else
					render json: {status: 'ERROR', message:'Order not updated', data: order.erros}, status: :unprocessable_entity
				end
      end

      def destroy
        order = Order.find(params[:id])
        order.destroy
        render json: {status: 'SUCCESS', message:'Deleted order', data: order}, status: :ok
      end

      private
      def orders_params
        params.permit(:name, :coffeeName, :total, :size)
      end

      # some comments
    end
  end
end
