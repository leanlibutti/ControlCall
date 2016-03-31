class Call < ActiveRecord::Base

	belongs_to :user


#	attr_accessor :incoming, :outgoing, :call_date, :call_time, :extension, :dial_number, :ring, :duration
#    attr_accessor :acc_code, :cd, :cost, :co



#	validates :call_date,
#  					presence:true
# 	validates :call_time,
# 					presence:true
# 	validates :extension,
# 					presence:true
# 	validates :dial_number,
# 					presence:true
# 	validates :co,
# 					presence:true
# 	validates :cd,
# 					presence:true
# 	validates :call_date,
# 					presence:true
# 	validates :incoming,
# 					presence:true
# 	validates :outgoing,
# 					presence:true
# 	validates :ring,
#jhf		presence:true
#  	 				validates_exclusion_of: in:{ with: /\A[a-zA-Z]+\z/}
 # 	validates :duration,
  #					presence:true
  #	validates :cost,
  #					presence:true,
# 	 				validates_exclusion_of: in:{ with: /\A[a-zA-Z]+\z/}
  #	validates :acc_code,
  #					presence:true,
#					validates_exclusion_of: in:{ with: /\A[a-zA-Z]+\z/}

	
end
