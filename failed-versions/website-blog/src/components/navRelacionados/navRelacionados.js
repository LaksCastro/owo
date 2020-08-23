import React from "react"

import propTypes from "prop-types"

import getTheme from "../../utils/getTheme"

import * as S from "./style"

const NavRelacionados = props => {  
    const { prev, next } = props

    return(
        <S.NavRelWrapper>
            {prev && (
                <S.NavRelLinkContainer paintDrip color={getTheme()} duration={1} to={prev.fields.slug}>
                    <S.NavRelLinkText>
                        {prev.frontmatter.title}
                    </S.NavRelLinkText>
                </S.NavRelLinkContainer>
                )
            }
            {next && (
                <S.NavRelLinkContainer paintDrip color={getTheme()} duration={1} to={next.fields.slug}>
                    <S.NavRelLinkText>
                        {next.frontmatter.title}

                    </S.NavRelLinkText>
                </S.NavRelLinkContainer>
                )
            }
        </S.NavRelWrapper>
    )
}

NavRelacionados.propTypes = {
    next: propTypes.shape({
        frontmatter: propTypes.shape({
            title: propTypes.string.isRequired
        }),
        fields: propTypes.shape({
            slug: propTypes.string.isRequired
        }),
    }),
    prev: propTypes.shape({
        frontmatter: propTypes.shape({
            title: propTypes.string.isRequired
        }),
        fields: propTypes.shape({
            slug: propTypes.string.isRequired
        }), 
    })
}



export default NavRelacionados