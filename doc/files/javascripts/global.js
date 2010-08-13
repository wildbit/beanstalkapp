var Beanstalk = {
	
	init: function(){
		$$('.code_container.response').addEvent('click', function(){
			this.addClass('expand');
		});
	}
	
}

window.addEvent('domready', Beanstalk.init);


/* Extensions */

Element.implement({
	
	showMe: function(){
		if (this.isHidden()) this.removeClass('hidden');
		
		return this;
	},
	
	hideMe: function(){
		if (!this.isHidden()) this.addClass('hidden');
		
		return this;
	},
	
	toggleMe: function(){
		return this.toggleClass('hidden');
	},
	
	isHidden: function(){
		if (!this.hasClass('hidden')) {
			return false;
		} else {
			return true;
		}
	},
	
	appendHTML: function(html){
		if ($type(html) != 'string') return false;
		
		var tmp = new Element('div');
		tmp.set('html', html);
		this.adopt(tmp.childNodes);
		
		return this;
	}
	
});

Window.implement({
	
	$E: function(selector){
		return $$(selector)[0];
	},
	
	exists: function(selector){
		if ($$(selector).length > 0 || $(selector) != undefined)
			return true;
		else
			return false
	}
	
});