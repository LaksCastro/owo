import React from "react"
import { graphql } from "gatsby"

import Layout from "../components/layout/layout"
import SEO from "../components/seo"
import PostItem from "../components/postItem/postItem"
import NavPages from "../components/navPages/navPages"
import * as S from "../components/listWrapper/style"
const BlogList = props => {
    const edges = props.data.allMarkdownRemark.edges

    const { numPages, currentPage } = props.pageContext

    return(
        <Layout>
            <SEO
              title="Home"
            />
            <S.ListWrapper>
              {edges.map(
              ({ node: { 
                  frontmatter: { 
                      background, 
                      category, 
                      date, 
                      title, 
                      description 
                  }, 
                  fields: {
                      slug
                  },
                  timeToRead,
                  }
              }, i) => (
                <PostItem
                    key={i}
                    slug={slug}
                    backgroundColor={background}
                    text={category}
                    postItemDate={date}
                    postItemTimeToRead={timeToRead}
                    postItemTitle={title}
                    postItemDescription={description}
                />
              ))}
            </S.ListWrapper>
            
            {numPages > 1 &&
              <NavPages 
              isFirst={currentPage === 1}
              isLast={currentPage === numPages}
              currentPage={currentPage}
              numPages={numPages}
              prevPage={(currentPage - 1).toString()}
              nextPage={(currentPage + 1).toString()}
              />
            }
            
        </Layout>
    )
}

export const query =
graphql`
   query PostList($limit: Int!, $skip: Int!){
    allMarkdownRemark(sort: {fields: frontmatter___date, order: DESC}, limit: $limit, skip: $skip) {
      edges {
        node {
          frontmatter {
            background
            date(locale: "pt-br", difference: "", formatString: "DD [de] MMMM [de] YYYY")
            description
            category
            title
          }
          fields {
            slug
          }
          timeToRead
        }
      }
    }
  }
`

export default BlogList 
