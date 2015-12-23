import IdeasContainer from '../containers/IdeasContainer';
import IdeaFormContainer from '../containers/IdeaFormContainer';
import NewIdeaButtonContainer from '../containers/NewIdeaButtonContainer';

// This is how react_on_rails can see the IdeasContainer in the browser.
global.IdeasContainer = IdeasContainer;
global.IdeaFormContainer = IdeaFormContainer;
global.NewIdeaButtonContainer = NewIdeaButtonContainer;
