class Array;def binSearch(tH_iNg3Y_,___=0,____ = nil);____=self.size unless ____;________=(___+____)/2;if (___==____&&tH_iNg3Y_!=self[________]);return nil;elsif tH_iNg3Y_==self[________];return tH_iNg3Y_;elsif tH_iNg3Y_>self[________];binSearch(tH_iNg3Y_, ________+1,____);else binSearch(tH_iNg3Y_, ___, ________-1);end end end

#main code
testArray = [1,2,3,4,5,6,7,8,9,10]
puts testArray.binSearch(3)
puts testArray.binSearch(20)
puts testArray.binSearch(7)