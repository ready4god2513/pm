class IterationState < ClassyEnum::Base
end

class IterationState::Current < IterationState
end

class IterationState::Future < IterationState
end

class IterationState::Past < IterationState
end
