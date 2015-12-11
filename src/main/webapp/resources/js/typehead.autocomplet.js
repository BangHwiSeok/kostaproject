/**
 * 
 */

function autocomplete(bindingtarget, form, usernum, contextpath, targetURL, target) {
						$(bindingtarget)
								.bind(
										'click',
										function() {
											var params = $(form).serialize();

											$
													.ajax({
														url : "evalues/create/"
																+ $(usernum)
																		.val(),
														data : params,
														type : 'POST',
														dataType : 'json',
														jsonpCallback : 'callback',
														success : function(data) {
															if(data.callback){
																window.location.href = contextpath;
																alert('test');
															}else{
																alert('keyword를 다시 입력해주세요');
															}
														},
														error : function(xhr,
																status, error) {
															alert("code: "
																	+ xhr.status)
															console
																	.log("code : "
																			+ xhr.status
																			+ "-- error : "
																			+ error);
														}
													});
										});
						var bestPictures = new Bloodhound(
								{
									datumTokenizer : function(datum) {
										return Bloodhound.tokenizers
												.whitespace(datum.value);
									},
									queryTokenizer : Bloodhound.tokenizers.whitespace,
									remote : {
										url : targetURL+'%QUERY',
										wildcard : '%QUERY',
										filter : function(data) {
											// Map the remote source JSON array
											// to a JavaScript object array
											console.log(data);
											return $.map(data, function(value) {
												return {
													value : value.k_NAME
												};
											});
										}
									}
								});
						console.log(bestPictures);
						bestPictures.initialize();

						$(target).typeahead(null, {
							displayKey : 'value',
							source : bestPictures.ttAdapter()

						});
					}