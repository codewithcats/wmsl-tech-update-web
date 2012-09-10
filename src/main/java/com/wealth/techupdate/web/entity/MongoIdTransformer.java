package com.wealth.techupdate.web.entity;

import flexjson.transformer.AbstractTransformer;

public class MongoIdTransformer extends AbstractTransformer {

	@Override
	public void transform(Object src) {
		getContext().writeQuoted(src.toString());
	}

}
