# coding: utf-8

class RecordsController < ApplicationController
  def index
    @records = Record.search(params[:q])
    @records = Record.order('created_at DESC').page params[:page]
  end

  def search
    @records = Record.search(params[:q])
    @records = Record.order('created_at DESC').page params[:page]
    render "index"
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @record = Record.new(deploy_date: Date.today)
  end

  def edit
    @record = Record.find(params[:id])
  end

  def create
    @record = Record.new(params[:record])
    if @record.save
      redirect_to @record, notice: "デプロイ情報を登録しました。"
    else
      render "new"
    end
  end

  def update
    @record = Record.find(params[:id])
    @record.assign_attributes(params[:record])
    if @record.save
      redirect_to @record, notice: "デプロイ情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to :records, notice: "デプロイ情報を削除しました。"
  end
end
