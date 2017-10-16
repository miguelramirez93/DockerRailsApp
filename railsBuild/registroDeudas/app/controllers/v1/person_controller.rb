require 'ostruct'
require 'json'
class V1::PersonController < ApplicationController
	def getPersons
			begin
				query = []
				params.each { 
					|k, v|
					if k != "controller" && k != "action"
						query.push({k => /^.*#{v}.*$/i})
					end
				}
				if params[:_id] != nil
					@p = Person.find(params[:_id])
				elsif query.length > 0
					criteria = Person
					query.each {
						|q|
						 criteria = criteria.where(q)			
					}
					 @p = criteria
				else
					@p = Person.all
		 		end
    			render :json => @p 
			rescue Exception => e
				res = Alert.new("ED_001","error",e)
				render :json => res 
			end
	end
	def createPerson
			begin
				jsperson = JSON.parse request.body.read
				@p = Person.new(jsperson)
		 		res = @p.save
    			if res
		 			res = Alert.new("SC_001","success",@p)
		 		else
		 			res = Alert.new("EC_001","error",@p)
		 		end
    		render :json => res 
			rescue Exception => e
				res = Alert.new("ED_001","error",e)
				render :json => res 	
			end
					
	end
	def updatePerson
			begin
				jsperson = JSON.parse request.body.read
				@p = Person.new(jsperson)
		 		res = Person.find(@p._id).update(attributes = jsperson)
    			if res
		 			res = Alert.new("SU_001","success",@p)
		 		else
		 			res = Alert.new("EU_001","error",@p)	
		 		end
    		render :json => res 
			rescue Exception => e
				res = Alert.new("ED_001","error",e)
				render :json => res 	
			end
					
	end
	def deletePerson
			begin
		 		res = Person.where(_id: params[:_id]).delete
    			if res
		 			res = Alert.new("SC_001","success",@p)
		 		else
		 			res = Alert.new("EC_001","error",@p)
		 		end
    		render :json => res 
			rescue Exception => e
				res = Alert.new("ED_001","error",e)
				render :json => res 	
			end
					
	end
end
