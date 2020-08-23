import React from "react"
import PropTypes from "prop-types"

import getTheme from "../../utils/getTheme"

import * as S from "./style"

const PostItem = ( props ) => (
    <S.PostItemWrapper paintDrip color={getTheme()} duration={1} to={props.slug}>
        <S.PostItemImgContainer>
            <S.PostItemImg 
            backgroundColor={props.backgroundColor}
            text={props.text}
                >{(props.text).toUpperCase()}
            </S.PostItemImg>
        </S.PostItemImgContainer>
        <S.PostItemContent>
            <S.PostItemDate>{props.postItemDate} | {props.postItemTimeToRead} min</S.PostItemDate>
            <S.PostItemTitle>{props.postItemTitle}</S.PostItemTitle>
            <S.PostItemDescription>{props.postItemDescription}</S.PostItemDescription>
        </S.PostItemContent>
    </S.PostItemWrapper>
)

PostItem.propTypes = {
    slug: PropTypes.string.isRequired,
    backgroundColor: PropTypes.string.isRequired,
    text: PropTypes.string.isRequired,
    postItemDate: PropTypes.string.isRequired,
    postItemTimeToRead: PropTypes.number.isRequired,
    postItemTitle: PropTypes.string.isRequired,
    postItemDescription: PropTypes.string.isRequired,
}
export default PostItem