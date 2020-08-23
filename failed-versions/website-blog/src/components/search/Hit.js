import React from "react"

import PostItem from "../postItem/postItem"

const Hit = ( { hit } ) => {
    return(
        <PostItem 
            slug={hit.fields.slug}
            postItemTitle={hit.title}
            postItemDate={hit.date}
            postItemDescription={hit.description}
            text={hit.category}
            backgroundColor={hit.background}
            postItemTimeToRead={hit.timeToRead}
        />
    )
}

export default Hit