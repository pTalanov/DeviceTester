require 'orders_helper'

class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.xml
  def index
    if params[:client_id]
      @client = Client.find(params[:client_id])
      @orders = @client.orders.active
    else
      @orders = Order.active
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  def all
    if params[:client_id]
      @client = Client.find(params[:client_id])
      @orders = @client.orders
    else
      @orders = Order.all
    end

    respond_to do |format|
      format.html { render :action => 'index'}
      format.xml  { render :xml => @orders }
    end

  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Client.find(params[:client_id]).orders.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create

    @order = Client.find(params[:client_id]).orders.new
    @order.update_attributes(params)
    @order.is_active = true
    generate_public_id @order

    respond_to do |format|
      if @order.save
        format.html { redirect_to(@order, :notice => 'Order was successfully created.') }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end


  def generate_public_id order

    order.public_id = "#{order.client_id}@#{Time.now.to_s(:number)}"

  end


end
