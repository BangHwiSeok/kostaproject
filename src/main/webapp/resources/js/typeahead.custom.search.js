/**
 * 
 */

function search(target,targetURL, inputNum,appendTarget) {

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
											// console.log(data);
											return $.map(data, function(value) {
												return {
													value : value.k_name
												};
											});
										}
									}
								});
						bestPictures.initialize();

						$(target).typeahead(
								null,
								{
									displayKey : 'value',
									source : bestPictures.ttAdapter(),
									templates : {
										suggestion : function(data) {
											// console.log(data.value);
											return '<p><strong>' + data.value
													+ '</strong></p>';
										}
									}
								});
						$(target).bind('typeahead:select',
								function(ev, suggestion) {
							/* $('#test').html('<p>'+suggestion.value+'</p>'); */
							console.log($(inputNum).val());
							var num = parseInt($(inputNum).val());
									$(appendTarget).append("<input type='text'  name='key[]' value='"+suggestion.value+"' readonly='readonly' />");
									$('#num').val(num+1);
								});
					}